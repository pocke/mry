require 'test_helper'

class TestRunner < Minitest::Test
  def test_run_with_master
    prev = <<~END
      # master
      Style/VariableName:
        Enabled: true

      # 0.49.0
      Style/Tab:
        Enabled: true

      # 0.47.0
      Lint/Eval:
        Enabled: true

      # 0.46.0
      Performance/SortWithBlock:
        Enabled: false
    END
    expected = <<~END
      # master
      Naming/VariableName:
        Enabled: true

      # 0.49.0
      Layout/Tab:
        Enabled: true

      # 0.47.0
      Security/Eval:
        Enabled: true

      # 0.46.0
      Performance/CompareWithBlock:
        Enabled: false
    END

    check_run(prev, expected, :master)
  end

  def test_run_with_0_47_0
    prev = <<~END
      # master
      Style/Tab:
        Enabled: true

      # 0.47.0
      Lint/Eval:
        Enabled: true
      Style/CaseIndentation:
        IndentWhenRelativeTo: case
      Lint/BlockAlignment:
        AlignWith: either
      Lint/EndAlignment:
        AlignWith: either
      Lint/DefEndAlignment:
        AlignWith: either
      Rails/UniqBeforePluck:
        EnforcedMode: conservative
      Style/MethodCallParentheses:
        Enabled: false

      # 0.46.0
      Performance/SortWithBlock:
        Enabled: false
    END
    expected = <<~END
      # master
      Style/Tab:
        Enabled: true

      # 0.47.0
      Security/Eval:
        Enabled: true
      Style/CaseIndentation:
        EnforcedStyle: case
      Lint/BlockAlignment:
        EnforcedStyleAlignWith: either
      Lint/EndAlignment:
        EnforcedStyleAlignWith: either
      Lint/DefEndAlignment:
        EnforcedStyleAlignWith: either
      Rails/UniqBeforePluck:
        EnforcedStyle: conservative
      Style/MethodCallWithoutArgsParentheses:
        Enabled: false

      # 0.46.0
      Performance/CompareWithBlock:
        Enabled: false
    END

    check_run(prev, expected, '0.47.0')
  end

  def test_run_with_0_46_0
    prev = <<~END
      # 0.47.0
      Lint/Eval:
        Enabled: true
      Style/CaseIndentation:
        EnforcedStyle: case
      Style/MethodCallWithoutArgsParentheses:
        Description: 'Do not use parentheses for method calls with no arguments.'
        StyleGuide: 'https://github.com/bbatsov/ruby-style-guide#no-args-no-parens'
        Enabled: false

      # 0.46.0
      Performance/SortWithBlock:
        Enabled: false
    END
    expected = <<~END
      # 0.47.0
      Lint/Eval:
        Enabled: true
      Style/CaseIndentation:
        IndentWhenRelativeTo: case
      Style/MethodCallParentheses:
        Description: 'Do not use parentheses for method calls with no arguments.'
        StyleGuide: 'https://github.com/bbatsov/ruby-style-guide#no-args-no-parens'
        Enabled: false

      # 0.46.0
      Performance/CompareWithBlock:
        Enabled: false
    END

    check_run(prev, expected, '0.46.0')
  end

  def test_run_older
    prev = <<~END
      # 0.47.0
      Lint/Eval:
        Enabled: true

      # 0.46.0
      Performance/SortWithBlock:
        Enabled: false

      # Older
      Style/SingleSpaceBeforeFirstArg:
        Enabled: false
      Style/SpaceAroundOperators:
        MultiSpaceAllowedForOperators: true
    END
    expected = <<~END
      # 0.47.0
      Lint/Eval:
        Enabled: true

      # 0.46.0
      Performance/SortWithBlock:
        Enabled: false

      # Older
      Style/SpaceBeforeFirstArg:
        Enabled: false
      Style/SpaceAroundOperators:
        AllowForAlignment: true
    END

    check_run(prev, expected, '0')
  end

  def test_run_without_target_option
    prev = <<~END
      # 0.49.0
      Style/Tab:
        Enabled: true

      # 0.47.0
      Lint/Eval:
        Enabled: true
      Lint/BlockAlignment:
        AlignWith: either
      Lint/EndAlignment:
        AlignWith: either
      Lint/DefEndAlignment:
        AlignWith: either
      Rails/UniqBeforePluck:
        EnforcedMode: conservative
      Style/MethodCallParentheses:
        Enabled: false

      # 0.46.0
      Performance/SortWithBlock:
        Enabled: false
    END
    expected = <<~END
      # 0.49.0
      Layout/Tab:
        Enabled: true

      # 0.47.0
      Security/Eval:
        Enabled: true
      Lint/BlockAlignment:
        EnforcedStyleAlignWith: either
      Lint/EndAlignment:
        EnforcedStyleAlignWith: either
      Lint/DefEndAlignment:
        EnforcedStyleAlignWith: either
      Rails/UniqBeforePluck:
        EnforcedStyle: conservative
      Style/MethodCallWithoutArgsParentheses:
        Enabled: false

      # 0.46.0
      Performance/CompareWithBlock:
        Enabled: false
    END

    check_run(prev, expected, nil)
  end

  def test_run_with_from_option
    prev = <<~YAML
      # Renamed
      Lint/LiteralInCondition:
        Enabled: false
    YAML

    expected = <<~YAML
      # Renamed
      Lint/LiteralAsCondition:
        Enabled: false


      # The following cops are added between 0.50.0 and 0.51.0.
      # The configurations are default.
      # If you want to use a cop by default, remove a configuration for the cop from here.
      # If you want to disable a cop, change `Enabled` to false.

      # Supports --auto-correct
      Gemspec/OrderedDependencies:
        Description: Dependencies in the gemspec should be alphabetically sorted.
        Enabled: true
        Include:
        - "**/*.gemspec"
        TreatCommentsAsGroupSeparators: true

      # Supports --auto-correct
      Lint/RedundantWithObject:
        Description: Checks for redundant `with_object`.
        Enabled: true

      Lint/RegexpAsCondition:
        Description: Do not use regexp literal as a condition. The regexp literal matches
          `$_` implicitly.
        Enabled: true

      # Supports --auto-correct
      Lint/UnneededRequireStatement:
        Description: Checks for unnecessary `require` statement.
        Enabled: true

      Rails/UnknownEnv:
        Description: Use correct environment name.
        Enabled: true
        Environments:
        - development
        - test
        - production

      Style/CommentedKeyword:
        Description: Do not place comments on the same line as certain keywords.
        Enabled: true

      Style/DateTime:
        Description: Use Date or Time over DateTime.
        StyleGuide: "#date--time"
        Enabled: true

      Style/MixinUsage:
        Description: Checks that `include`, `extend` and `prepend` exists at the top level.
        Enabled: true

      # Supports --auto-correct
      Style/StderrPuts:
        Description: Use `warn` instead of `$stderr.puts`.
        StyleGuide: "#warn"
        Enabled: true
    YAML
    check_run(prev, expected, '0.51.0', from: '0.50.0')
  end

  def check_run(prev, expected, version, from: nil)
    # Check runner
    Tempfile.open do |file|
      file.write(prev)
      file.close
      v =
        case version
        when nil
          Gem::Version.new('1000000')
        when Symbol
          version
        else
          Gem::Version.new(version)
        end
      from_v = Gem::Version.new(from) if from

      Mry::Runner.run([file.path], to: v, from: from_v)
      got = File.read(file.path)
      assert_equal expected, got
    end

    # Check `mry` command
    Tempfile.open do |file|
      file.write(prev)
      file.close
      args = [
        (['--target', version.to_s] if version),
        (['--from', from] if from),
      ].flatten.compact
      system('ruby', Pathname(__dir__).join('../../exe/mry').to_s, *args, file.path) || raise
      got = File.read(file.path)
      assert {expected == got}
    end
  end
end

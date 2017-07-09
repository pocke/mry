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

  def check_run(prev, expected, version)
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

      Mry::Runner.run([file.path], v)
      got = File.read(file.path)
      assert {expected == got}
    end

    # Check `mry` command
    Tempfile.open do |file|
      file.write(prev)
      file.close
      target = version ? ['--target', version.to_s] : []
      system('ruby', Pathname(__dir__).join('../../exe/mry').to_s, *target, file.path) || raise
      got = File.read(file.path)
      assert {expected == got}
    end
  end
end

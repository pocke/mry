require 'test_helper'

class TestRunner < Minitest::Test
  def test_run_with_master
    prev = <<~END
      # master
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

      # 0.46.0
      Performance/SortWithBlock:
        Enabled: false
    END
    expected = <<~END
      # 0.47.0
      Lint/Eval:
        Enabled: true

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

  def check_run(prev, expected, version)
    # Check runner
    Tempfile.open do |file|
      file.write(prev)
      file.close
      Mry::Runner.run([file.path], version.is_a?(Symbol) ? version : Gem::Version.new(version))
      got = File.read(file.path)
      assert {expected == got}
    end

    # Check `mry` command
    Tempfile.open do |file|
      file.write(prev)
      file.close
      system('ruby', Pathname(__dir__).join('../../exe/mry').to_s, '--target', version.to_s, file.path) || raise
      got = File.read(file.path)
      assert {expected == got}
    end
  end
end

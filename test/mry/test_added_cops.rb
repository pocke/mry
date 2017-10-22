require 'test_helper'
require 'yaml'

class TestAddedCops < Minitest::Test
  def test_added_cops
    cops = Mry::AddedCops.added_cops(
      from: Gem::Version.new('0.50.0'),
      to: Gem::Version.new('0.51.0')
    )

    assert_equal %w[
      Rails/UnknownEnv
      Style/StderrPuts
      Lint/UnneededRequireStatement
      Lint/RedundantWithObject
      Style/CommentedKeyword
      Lint/RegexpAsCondition
      Style/MixinUsage
      Style/DateTime
      Gemspec/OrderedDependencies
    ], cops

    cops = Mry::AddedCops.added_cops(
      from: Gem::Version.new('0.49.0'),
      to: Gem::Version.new('0.50.0')
    )

    assert_equal %w[
      Style/RedundantConditional
      Naming/HeredocDelimiterNaming
      Lint/ReturnInVoidContext
      Lint/BooleanSymbol
      Rails/HasManyOrHasOneDependent
      Style/Dir
      Naming/HeredocDelimiterCase
      Lint/RescueWithoutErrorClass
      Performance/UnfreezeString
      Style/OrAssignment
      Style/ReturnNil
      Lint/UriEscapeUnescape
      Performance/UriDefaultParser
      Lint/UriRegexp
      Style/MinMax
      Bundler/InsecureProtocolSource
      Lint/RedundantWithIndex
      Lint/InterpolationCheck
    ], cops

    cops = Mry::AddedCops.added_cops(
      from: Gem::Version.new('0.47.0'),
      to: Gem::Version.new('0.49.0')
    )

    assert_equal %w[
      Rails/ApplicationJob
      Rails/ApplicationRecord
      Performance/Caller
      Style/FormatStringToken
      Lint/ScriptPermission
      Style/YodaCondition
      Style/MultipleComparison
      Lint/RescueType
      Performance/DoubleStartEndWith
      Layout/EmptyLineAfterMagicComment
      Style/MixinGrouping
      Layout/EmptyLinesAroundBeginBody
      Layout/EmptyLinesAroundExceptionHandlingKeywords
      Rails/RelativeDateConstant
      Layout/IndentHeredoc
      Style/InverseMethods
      Rails/ActiveSupportAliases
      Lint/AmbiguousBlockAssociation
      Rails/Blank
      Rails/Present
    ], cops
  end

  def test_added_cops_yaml
    yaml = Mry::AddedCops.added_cops_yaml(
      from: Gem::Version.new('0.50.0'),
      to: Gem::Version.new('0.51.0'),
    )

    assert_equal <<~YAML, yaml
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
  end
end

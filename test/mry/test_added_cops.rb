require 'test_helper'
require 'yaml'

class TestAddedCops < Minitest::Test
  def test_added_cops
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
      from: Gem::Version.new('0.47.0'),
      to: Gem::Version.new('0.49.0'),
    )
    assert yaml.is_a?(String)
    assert YAML.parse(yaml)
  end
end

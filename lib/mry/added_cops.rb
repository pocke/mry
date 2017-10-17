module Mry
  module AddedCops
    Cops = {
      Gem::Version.new('0.50.0') => %w[
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
      ],
      Gem::Version.new('0.49.0') => %w[
        Rails/ApplicationJob
        Rails/ApplicationRecord
        Performance/Caller
        Style/FormatStringToken
        Lint/ScriptPermission
        Style/YodaCondition
        Style/MultipleComparison
        Lint/RescueType
      ],
      Gem::Version.new('0.48.0') => %w[
        Performance/DoubleStartEndWith
        Style/EmptyLineAfterMagicComment
        Style/MixinGrouping
        Style/EmptyLinesAroundBeginBody
        Style/EmptyLinesAroundExceptionHandlingKeywords
        Rails/RelativeDateConstant
        Style/IndentHeredoc
        Style/InverseMethods
        Rails/ActiveSupportAliases
        Lint/AmbiguousBlockAssociation
        Rails/Blank
        Rails/Present
      ],
      Gem::Version.new('0.47.0') => %w[
        Lint/MultipleCompare
        Lint/SafeNavigationChain
        Security/MarshalLoad
        Security/YAMLLoad
        Performance/RegexpMatch
        Rails/FilePath
        Rails/SkipsModelValidations
        Style/MethodCallWithArgsParentheses
        Rails/ReversibleMigration
      ],
      Gem::Version.new('0.46.0') => %w[
        Bundler/DuplicatedGem
        Style/EmptyMethod
        Rails/EnumUniqueness
        Bundler/OrderedGems
      ],
      Gem::Version.new('0.45.0') => %w[
        Lint/DuplicateCaseCondition
        Lint/EmptyWhen
        Style/MultilineIfModifier
        Style/SpaceInLambdaLiteral
        Lint/EmptyExpression
      ],
      Gem::Version.new('0.44.0') => %w[
        Rails/HttpPositionalArguments
        Metrics/BlockLength
        Rails/DynamicFindBy
        Rails/DelegateAllowBlank
        Style/MultilineMemoization
      ],
      Gem::Version.new('0.43.0') => %w[
        Style/DocumentationMethod
        Rails/SafeNavigation
        Rails/NotNullColumn
        Style/VariableNumber
        Security/JSONLoad
        Style/SafeNavigation
        Performance/SortWithBlock
        Lint/UnifiedInteger
      ],
      Gem::Version.new('0.42.0') => %w[
        Style/TernaryParentheses
        Style/MethodMissing
        Rails/SaveBang
        Style/NumericPredicate
      ],
      Gem::Version.new('0.41.0') => %w[
        Style/SpaceInsidePercentLiteralDelimiters
        Style/SpaceInsideArrayPercentLiteral
        Style/NumericLiteralPrefix
        Style/ImplicitRuntimeError
        Style/EachForSimpleLoop
        Lint/ShadowedException
        Lint/PercentSymbolArray
        Lint/PercentStringArray
        Lint/InheritException
        Performance/PushSplat
        Rails/RequestReferer
        Rails/OutputSafety
        Rails/Exit
      ],
    }.freeze

    class << self
      def added_cops(from:, to:)

      end
    end
  end
end

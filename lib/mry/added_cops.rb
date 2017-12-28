module Mry
  module AddedCops
    Cops = {
      Gem::Version.new('0.52.0') => %w[
        Style/StringHashKeys
        Style/RandomWithOffset
        Lint/ShadowedArgument
        Lint/MissingCopEnableDirective
        Rails/EnvironmentComparison
        Style/EmptyBlockParameter
        Style/EmptyLambdaParameter
        Style/TrailingBodyOnMethodDefinition
        Rails/InverseOf
        Style/TrailingMethodEndStatement
        Gemspec/RequiredRubyVersion
        Lint/NestedPercentLiteral
        Gemspec/DuplicatedAssignment
        Style/ColonMethodDefinition
        Layout/ClassStructure
        Rails/CreateTableWithTimestamps
        Rails/RedundantReceiverInWithOptions
        Style/EvalWithLocation
        Layout/EmptyLinesAroundArguments
        Layout/SpaceInsideReferenceBrackets
        Layout/SpaceInsideArrayLiteralBrackets
        Rails/LexicallyScopedActionFilter
        Rails/Presence
      ],
      Gem::Version.new('0.51.0') => %w[
        Rails/UnknownEnv
        Style/StderrPuts
        Lint/UnneededRequireStatement
        Lint/RedundantWithObject
        Style/CommentedKeyword
        Lint/RegexpAsCondition
        Style/MixinUsage
        Style/DateTime
        Gemspec/OrderedDependencies
      ],
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

    class RuboCopVersionMismatchError < StandardError
      def initialize(expected:)
        @expected = expected
      end

      def message
        <<~MES

          `require 'rubocop'` is failed because mry can't find rubocop v#{@expected}.
          Execute `gem install rubocop -v #{@expected}`.
          Or update rubocop version in your Gemfile, and execute `bundle install` if you use `bundle exec`.

        MES
      end
    end

    class << self
      def added_cops_yaml(from:, to:)
        begin
          gem 'rubocop', "= #{to}"
          require 'rubocop'
        rescue Gem::MissingSpecVersionError, Gem::LoadError
          raise RuboCopVersionMismatchError.new(expected: to)
        end
        cops = added_cops(from: from, to: to)
        return if cops.empty?

        in_tmpdir do |dir|
          dir.join('.rubocop.yml').write(<<~YAML)
            Rails:
              Enabled: true
          YAML
          stdout do
            RuboCop::CLI.new.run(['--show-cops', cops.join(',')])
          end
        end
      end

      def added_cops(from:, to:)
        range = from..to
        Cops
          .flat_map {|key, cops|  range.cover?(key) && from != key ? cops : [] }
          .map {|cop| update_name(cop: cop, to: to) }
      end

      private

      def update_name(cop:, to:)
        rewriters, reverse_rewriters = *Rewriters.rewriters(to)
        reverse_rewriters.each do |rew|
          rew.rules.each do |rule|
            cop = rule.replacement(cop, reverse: true) if rule.match?([cop], reverse: true)
          end
        end
        rewriters.each do |rew|
          rew.rules.each do |rule|
            cop = rule.replacement(cop, reverse: false) if rule.match?([cop], reverse: false)
          end
        end

        cop
      end

      def stdout(&block)
        stdout_back = $stdout
        $stdout = StringIO.new
        block.call
        $stdout.string
      ensure
        $stdout = stdout_back
      end

      def in_tmpdir(&block)
        Dir.mktmpdir do |dir|
          Dir.chdir(dir) do
            block.call(Pathname(dir))
          end
        end
      end
    end
  end
end

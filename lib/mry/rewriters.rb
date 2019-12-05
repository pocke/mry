module Mry
  module Rewriters
    class Rewriter_Master < YAMLRewriter::Rewriter
    end

    class Rewriter_0_77_0 < YAMLRewriter::Rewriter
      define_rule ['Naming/UncommunicativeMethodParamName' => 'Naming/MethodParameterName']
      define_rule ['Naming/UncommunicativeBlockParamName' => 'Naming/BlockParameterName']
      define_rule ['Lint/StringConversionInInterpolation' => 'Lint/RedundantStringCoercion']
      define_rule ['Lint/MultipleCompare' => 'Lint/MultipleComparison']
      define_rule ['Lint/HandleExceptions' => 'Lint/SuppressedException']
      define_rule ['Lint/DuplicatedKey' => 'Lint/DuplicateHashKey']
      define_rule ['Layout/TrailingBlankLines' => 'Layout/TrailingEmptyLines']
      define_rule ['Layout/LeadingBlankLines' => 'Layout/LeadingEmptyLines']
      define_rule ['Layout/IndentHeredoc' => 'Layout/HeredocIndentation']
      define_rule ['Layout/IndentFirstParameter' => 'Layout/FirstParameterIndentation']
      define_rule ['Layout/IndentFirstHashElement' => 'Layout/FirstHashElementIndentation']
      define_rule ['Layout/IndentFirstArrayElement' => 'Layout/FirstArrayElementIndentation']
      define_rule ['Layout/IndentFirstArgument' => 'Layout/FirstArgumentIndentation']
      define_rule ['Layout/IndentAssignment' => 'Layout/AssignmentIndentation']
      define_rule ['Layout/AlignParameters' => 'Layout/ParameterAlignment']
      define_rule ['Layout/AlignHash' => 'Layout/HashAlignment']
      define_rule ['Layout/AlignArray' => 'Layout/ArrayAlignment']
      define_rule ['Layout/AlignArguments' => 'Layout/ArgumentAlignment']
    end

    class Rewriter_0_76_0 < YAMLRewriter::Rewriter
      define_rule ['Lint/UnneededSplatExpansion' => 'Lint/RedundantSplatExpansion']
      define_rule ['Lint/UnneededRequireStatement' => 'Lint/RedundantRequireStatement']
      define_rule ['Lint/UnneededCopEnableDirective' => 'Lint/RedundantCopEnableDirective']
      define_rule ['Lint/UnneededCopDisableDirective' => 'Lint/RedundantCopDisableDirective']
      define_rule ['Style/UnneededSort' => 'Style/RedundantSort']
      define_rule ['Style/UnneededPercentQ' => 'Style/RedundantPercentQ']
      define_rule ['Style/UnneededInterpolation' => 'Style/RedundantInterpolation']
      define_rule ['Style/UnneededCondition' => 'Style/RedundantCondition']
      define_rule ['Style/UnneededCapitalW' => 'Style/RedundantCapitalW']
    end

    class Rewriter_0_75_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_74_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_73_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_72_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_71_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_70_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_69_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_68_0 < YAMLRewriter::Rewriter
      define_rule ['Layout/FirstParameterIndentation' => 'Layout/IndentFirstArgument']
    end

    class Rewriter_0_67_0 < YAMLRewriter::Rewriter
      define_rule ['Performance/RedundantSortBy' => 'Style/RedundantSortBy']
      define_rule ['PerfoPerformance/Sample' => 'Style/Sample']
      define_rule ['PerfoPerformance/UnneededSort' => 'Style/UnneededSort']
      define_rule ['Style/LstripRstrip' => 'Style/Strip']
      define_rule ['Performance/LstripRstrip' => 'Style/LstripRstrip']
    end

    class Rewriter_0_66_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_65_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_64_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_63_0 < YAMLRewriter::Rewriter
      define_rule ['Style/FlipFlop' => 'Lint/FlipFlop']
    end

    class Rewriter_0_62_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_61_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_60_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_59_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_58_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_57_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_56_0 < YAMLRewriter::Rewriter
      define_rule ['Style/EmptyLineAfterGuardClause' => 'Layout/EmptyLineAfterGuardClause']
    end

    class Rewriter_0_55_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_54_0 < YAMLRewriter::Rewriter
    end

    class Rewriter_0_53_0 < YAMLRewriter::Rewriter
      define_rule ['Naming/UncommunicativeMethodArgName' => 'Naming/UncommunicativeMethodParamName']
      define_rule ['Lint/ConditionPosition' => 'Layout/ConditionPosition']
      define_rule ['Lint/BlockAlignment' => 'Layout/BlockAlignment']
      define_rule ['Lint/DefEndAlignment' => 'Layout/DefEndAlignment']
      define_rule ['Lint/EndAlignment' => 'Layout/EndAlignment']
      define_rule ['Lint/UnneededDisable' => 'Lint/UnneededCopDisableDirective']
    end

    class Rewriter_0_52_0 < YAMLRewriter::Rewriter
      define_rule ['Lint/RescueWithoutErrorClass' => 'Style/RescueStandardError']
    end

    class Rewriter_0_51_0 < YAMLRewriter::Rewriter
      define_rule ['Lint/LiteralInCondition' => 'Lint/LiteralAsCondition']
    end

    class Rewriter_0_50_0 < YAMLRewriter::Rewriter
      define_rule ['Style/AccessorMethodName' => 'Naming/AccessorMethodName']
      define_rule ['Style/AsciiIdentifiers' => 'Naming/AsciiIdentifiers']
      define_rule ['Style/OpMethod' => 'Naming/BinaryOperatorParameterName']
      define_rule ['Style/ClassAndModuleCamelCase' => 'Naming/ClassAndModuleCamelCase']
      define_rule ['Style/ConstantName' => 'Naming/ConstantName']
      define_rule ['Style/FileName' => 'Naming/FileName']
      define_rule ['Style/MethodName' => 'Naming/MethodName']
      define_rule ['Style/PredicateName' => 'Naming/PredicateName']
      define_rule ['Style/VariableName' => 'Naming/VariableName']
      define_rule ['Style/VariableNumber' => 'Naming/VariableNumber']
    end

    class Rewriter_0_49_0 < YAMLRewriter::Rewriter
      layout_cops = %w[
        Layout/AccessModifierIndentation
        Layout/AlignArray
        Layout/AlignHash
        Layout/AlignParameters
        Layout/BlockEndNewline
        Layout/CaseIndentation
        Layout/ClosingParenthesisIndentation
        Layout/CommentIndentation
        Layout/DotPosition
        Layout/ElseAlignment
        Layout/EmptyLineAfterMagicComment
        Layout/EmptyLineBetweenDefs
        Layout/EmptyLinesAroundAccessModifier
        Layout/EmptyLinesAroundBeginBody
        Layout/EmptyLinesAroundBlockBody
        Layout/EmptyLinesAroundClassBody
        Layout/EmptyLinesAroundExceptionHandlingKeywords
        Layout/EmptyLinesAroundMethodBody
        Layout/EmptyLinesAroundModuleBody
        Layout/EmptyLines
        Layout/EndOfLine
        Layout/ExtraSpacing
        Layout/FirstArrayElementLineBreak
        Layout/FirstHashElementLineBreak
        Layout/FirstMethodArgumentLineBreak
        Layout/FirstMethodParameterLineBreak
        Layout/FirstParameterIndentation
        Layout/IndentArray
        Layout/IndentAssignment
        Layout/IndentationConsistency
        Layout/IndentationWidth
        Layout/IndentHash
        Layout/IndentHeredoc
        Layout/InitialIndentation
        Layout/LeadingCommentSpace
        Layout/MultilineArrayBraceLayout
        Layout/MultilineAssignmentLayout
        Layout/MultilineBlockLayout
        Layout/MultilineHashBraceLayout
        Layout/MultilineMethodCallBraceLayout
        Layout/MultilineMethodCallIndentation
        Layout/MultilineMethodDefinitionBraceLayout
        Layout/MultilineOperationIndentation
        Layout/RescueEnsureAlignment
        Layout/SpaceAfterColon
        Layout/SpaceAfterComma
        Layout/SpaceAfterMethodName
        Layout/SpaceAfterNot
        Layout/SpaceAfterSemicolon
        Layout/SpaceAroundBlockParameters
        Layout/SpaceAroundEqualsInParameterDefault
        Layout/SpaceAroundKeyword
        Layout/SpaceAroundOperators
        Layout/SpaceBeforeBlockBraces
        Layout/SpaceBeforeComma
        Layout/SpaceBeforeComment
        Layout/SpaceBeforeFirstArg
        Layout/SpaceBeforeSemicolon
        Layout/SpaceInLambdaLiteral
        Layout/SpaceInsideArrayPercentLiteral
        Layout/SpaceInsideBlockBraces
        Layout/SpaceInsideBrackets
        Layout/SpaceInsideHashLiteralBraces
        Layout/SpaceInsideParens
        Layout/SpaceInsidePercentLiteralDelimiters
        Layout/SpaceInsideRangeLiteral
        Layout/SpaceInsideStringInterpolation
        Layout/Tab
        Layout/TrailingBlankLines
        Layout/TrailingWhitespace
      ]

      layout_cops.each do |cop|
        define_rule [cop.sub('Layout', 'Style') => cop]
      end
    end

    class Rewriter_0_48_0 < YAMLRewriter::Rewriter
      # 0.48.0 release does not have renaming.
    end

    class Rewriter_0_47_0 < YAMLRewriter::Rewriter
      define_rule ['Lint/Eval' => 'Security/Eval']
      define_rule ['Style/CaseIndentation', 'IndentWhenRelativeTo' => 'EnforcedStyle']
      define_rule ['Lint/BlockAlignment', 'AlignWith' => 'EnforcedStyleAlignWith']
      define_rule ['Lint/EndAlignment', 'AlignWith' => 'EnforcedStyleAlignWith']
      define_rule ['Lint/DefEndAlignment', 'AlignWith' => 'EnforcedStyleAlignWith']
      define_rule ['Rails/UniqBeforePluck', 'EnforcedMode' => 'EnforcedStyle']
      define_rule ['Style/MethodCallParentheses' => 'Style/MethodCallWithoutArgsParentheses']
    end

    class Rewriter_0_46_0 < YAMLRewriter::Rewriter
      define_rule ['Performance/SortWithBlock' => 'Performance/CompareWithBlock']
    end

    class Rewriter_0_45_0 < YAMLRewriter::Rewriter
      # 0.45.0 release does not have renaming.
    end

    class Rewriter_0_44_0 < YAMLRewriter::Rewriter
      # 0.44.0 release does not have renaming.
    end

    class Rewriter_0_43_0 < YAMLRewriter::Rewriter
      define_rule ['Lint/UselessArraySplat' => 'Lint/UnneededSplatExpansion']
    end

    class Rewriter_0_42_0 < YAMLRewriter::Rewriter
      # 0.42.0 release does not have renaming.
    end

    class Rewriter_0_41_0 < YAMLRewriter::Rewriter
      define_rule ['Style/DeprecatedHashMethods' => 'Style/PreferredHashMethods']
    end

    class Rewriter_0 < YAMLRewriter::Rewriter
      define_rule ['Style/SingleSpaceBeforeFirstArg' => 'Style/SpaceBeforeFirstArg']
      define_rule ['Lint/SpaceBeforeFirstArg' => 'Style/SpaceBeforeFirstArg']
      define_rule ['Style/SpaceAfterControlKeyword' => 'Style/SpaceAroundKeyword']
      define_rule ['Style/SpaceBeforeModifierKeyword' => 'Style/SpaceAroundKeyword']
      define_rule ['Style/SpaceAroundOperators', 'MultiSpaceAllowedForOperators' => 'AllowForAlignment']
    end

    Rewriters = self.constants.grep(/^Rewriter_\d/).map do |name|
      version = Gem::Version.new(name[/Rewriter_(.+)$/, 1].gsub('_', '.'))
      klass = const_get(name)
      [version, klass]
    end.sort.reverse.to_h

    def self.rewriters(target)
        return [(Rewriters.values + [Rewriter_Master]).reverse, []] if target == :master

        Rewriters
          .partition{|key, _value| target >= key}
          .map{|rewriters| rewriters.map{|k, v| v}.reverse}
    end
  end
end

module Mry
  module Rewriters
    class Rewriter_Master < YAMLRewriter::Rewriter
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

    Rewriters = {
      Gem::Version.new('0.53.0') => Rewriter_0_53_0,
      Gem::Version.new('0.52.0') => Rewriter_0_52_0,
      Gem::Version.new('0.51.0') => Rewriter_0_51_0,
      Gem::Version.new('0.50.0') => Rewriter_0_50_0,
      Gem::Version.new('0.49.0') => Rewriter_0_49_0,
      Gem::Version.new('0.47.0') => Rewriter_0_47_0,
      Gem::Version.new('0.46.0') => Rewriter_0_46_0,
      Gem::Version.new('0.45.0') => Rewriter_0_45_0,
      Gem::Version.new('0.44.0') => Rewriter_0_44_0,
      Gem::Version.new('0.43.0') => Rewriter_0_43_0,
      Gem::Version.new('0.42.0') => Rewriter_0_42_0,
      Gem::Version.new('0.41.0') => Rewriter_0_41_0,
      Gem::Version.new('0')      => Rewriter_0,
    }.freeze

    def self.rewriters(target)
        return [(Rewriters.values + [Rewriter_Master]).reverse, []] if target == :master

        Rewriters
          .partition{|key, _value| target >= key}
          .map{|rewriters| rewriters.map{|k, v| v}.reverse}
    end
  end
end

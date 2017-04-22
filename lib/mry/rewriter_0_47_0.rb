module Mry
  class Rewriter_0_47_0 < YAMLRewriter::Rewriter
    define_rule ['Lint/Eval' => 'Security/Eval']
    define_rule ['Style/CaseIndentation', 'IndentWhenRelativeTo' => 'EnforcedStyle']
    define_rule ['Lint/BlockAlignment', 'AlignWith' => 'EnforcedStyleAlignWith']
    define_rule ['Lint/EndAlignment', 'AlignWith' => 'EnforcedStyleAlignWith']
    define_rule ['Lint/DefEndAlignment', 'AlignWith' => 'EnforcedStyleAlignWith']
    define_rule ['Rails/UniqBeforePluck', 'EnforcedMode' => 'EnforcedStyle']
    define_rule ['Style/MethodCallParentheses' => 'Style/MethodCallWithoutArgsParentheses']
  end
end

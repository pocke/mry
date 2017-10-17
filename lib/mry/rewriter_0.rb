module Mry
  class Rewriter_0 < YAMLRewriter::Rewriter
    define_rule ['Style/SingleSpaceBeforeFirstArg' => 'Style/SpaceBeforeFirstArg']
    define_rule ['Lint/SpaceBeforeFirstArg' => 'Style/SpaceBeforeFirstArg']
    define_rule ['Style/SpaceAfterControlKeyword' => 'Style/SpaceAroundKeyword']
    define_rule ['Style/SpaceBeforeModifierKeyword' => 'Style/SpaceAroundKeyword']
    define_rule ['Style/SpaceAroundOperators', 'MultiSpaceAllowedForOperators' => 'AllowForAlignment']
  end
end

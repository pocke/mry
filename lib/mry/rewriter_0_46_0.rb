module Mry
  class Rewriter_0_46_0 < YAMLRewriter::Rewriter
    define_rule ['Performance/SortWithBlock' => 'Performance/CompareWithBlock']
  end
end

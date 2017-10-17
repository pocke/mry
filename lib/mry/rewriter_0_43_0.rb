module Mry
  class Rewriter_0_43_0 < YAMLRewriter::Rewriter
    define_rule ['Lint/UselessArraySplat' => 'Lint/UnneededSplatExpansion']
  end
end

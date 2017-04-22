module YAMLRewriter
  module ScalarWithMark
    refine Psych::Nodes::Scalar do
      attr_accessor :mark
    end
  end
end

module YAMLRewriter
  class MarkHandler < ::Psych::TreeBuilder
    using ScalarWithMark

    def initialize(parser)
      @parser = parser
      super()
    end

    def scalar(value, anchor, tag, plain, quoted, style)
        mark = @parser.mark
      super.tap do |scalar|
        scalar.mark = mark
      end
    end
  end
end

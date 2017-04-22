module YAMLRewriter
  class Parser < ::Psych::Parser
    def initialize
      super(MarkHandler.new(self))
    end
  end
end

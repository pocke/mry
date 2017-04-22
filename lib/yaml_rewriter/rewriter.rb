module YAMLRewriter
  class Rewriter
    # @param yaml [String]
    def initialize(yaml)
      @yaml = yaml
      @rules = []
    end

    # @param rule [Array]
    def self.define_rule(rule)
      @rules.push([])
    end
  end
end

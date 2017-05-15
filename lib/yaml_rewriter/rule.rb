module YAMLRewriter
  class Rule
    def initialize(rule)
      @rule = rule
    end

    def match?(path)
      rule_path = @rule[0..-2] + [@rule.last.keys.first]
      rule_path == (path[(path.size-@rule.size)..-1])
    end

    def replacement(key)
      @rule.last[key]
    end
  end
end

module YAMLRewriter
  class Rule
    def initialize(rule)
      @rule = rule
    end

    def match?(path, reverse:)
      rule_path = @rule[0..-2] +
        (reverse ? [@rule.last.values.first] : [@rule.last.keys.first])
      rule_path == (path[(path.size-@rule.size)..-1])
    end

    def replacement(key, reverse:)
      reverse ?
        @rule.last.invert[key] :
        @rule.last[key]
    end
  end
end

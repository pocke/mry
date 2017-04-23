module YAMLRewriter
  class Rewriter
    using ScalarWithMark
    # @param yaml [String]
    def initialize(yaml)
      @yaml = yaml.dup
      @offset = 0
    end

    # @param rule [Array]
    def self.define_rule(rule)
      rules.push(rule)
    end

    def self.rules
      @rules ||= []
    end

    # @return [String]
    def rewrite
      tree = Parser.new.parse(@yaml).handler.root
      traverse(tree)
      @yaml
    end

    private

    def traverse(tree, path = [])
      case tree
      when Psych::Nodes::Mapping
        tree.children.each_slice(2) do |key, value|
          p = path + [key.value]
          rewrite_yaml(p, key)
          traverse(value, p)
        end
      else
        tree.children&.each do |c|
          traverse(c, path)
        end
      end
    end

    def rewrite_yaml(path, key)
      self.class.rules.each do |rule|
        next unless match_rule(rule, path)

        index = key.mark.index + @offset
        prev = key.value
        new = rule.last[prev]
        start_index = @yaml.rindex(prev, index)
        @yaml[start_index..(start_index+prev.size-1)] = new
        @offset += new.size-prev.size
      end
    end

    def match_rule(rule, path)
      rule_path = rule[0..-2] + [rule.last.keys.first]
      rule_path == (path[(path.size-rule.size)..-1])
    end
  end
end

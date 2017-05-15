module YAMLRewriter
  # Usage:
  #   class MyRewriter < YAMLRewriter::Rewriter
  #     define_rule ['foo' => 'bar']
  #     define_rule ['one', 'two', 'threeee' => 'three']
  #   end
  #
  #   MyRewriter.new('foo: baz').rewrite # => 'bar: baz'
  #
  #   rewriter = MyRewriter.new(<<-END)
  #     one:
  #       two:
  #         threeee: 123
  #   END
  #   rewriter.rewrite # => one:
  #                           two:
  #                             three: 123
  class Rewriter
    using ScalarWithMark
    # @param yaml [String]
    def initialize(yaml)
      @yaml = yaml.dup
      @offset = 0
    end

    # @param rule [Array]
    def self.define_rule(rule)
      rules.push(Rule.new(rule))
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
        next unless rule.match?(path, reverse: false)

        index = key.mark.index + @offset
        prev = key.value
        new = rule.replacement(prev, reverse: false)
        start_index = @yaml.rindex(prev, index)
        @yaml[start_index..(start_index+prev.size-1)] = new
        @offset += new.size-prev.size
      end
    end
  end
end

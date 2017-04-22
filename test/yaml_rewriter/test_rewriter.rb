require 'test_helper'

class TestRewriter < Minitest::Test
  def test_rewriter
    [
      [
        [['foo' => 'hello']],
        <<~END,
          foo:
            bar:
              hoge
            baz:
              fuga
        END
        <<~END,
          hello:
            bar:
              hoge
            baz:
              fuga
        END
      ],
      [
        [['foo' => 'hello']],
        'foo: hoge',
        'hello: hoge',
      ],
      [
        [['foo' => 'hello']],
        <<~END,
          bar: hoge
          foo: fuga
          baz: piyo
        END
        <<~END,
          bar: hoge
          hello: fuga
          baz: piyo
        END
      ],
      [
        [['foo', 'bar', 'baz' => 'hello']],
        <<~END,
          foo:
            bar:
              baz: 'poyo'
        END
        <<~END,
          foo:
            bar:
              hello: 'poyo'
        END
      ],
      [
        [
          ['foo', 'bar', 'baz' => 'hello'],
          ['foo', 'cat', 'dog' => 'meow']
        ],
        <<~END,
          foo:
            bar:
              baz: 'poyo'
            cat:
              dog: 42
        END
        <<~END,
          foo:
            bar:
              hello: 'poyo'
            cat:
              meow: 42
        END
      ],
    ].each do |rules, src, expected|
      klass = Class.new(YAMLRewriter::Rewriter) do
        rules.each do |rule|
          define_rule rule
        end
      end
      rewrited = klass.new(src).rewrite
      assert { rewrited == expected }
    end
  end
end

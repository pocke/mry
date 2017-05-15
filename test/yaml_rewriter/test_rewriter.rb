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
      [
        [
          ['foo', 'bar', 'baz' => 'hello'],
          ['foo', 'cat', 'dog' => 'meow']
        ],
        <<~END,
          # にゃーん
          foo:
            bar:
              baz: 'poyo'
              # にゃん🐱
            cat:
              dog: 42
        END
        <<~END,
          # にゃーん
          foo:
            bar:
              hello: 'poyo'
              # にゃん🐱
            cat:
              meow: 42
        END
      ],
      [
        [
          ['foo' => 'hello'],
          ['bar', 'baz' => 'world'],
        ],
        <<~END,
          {
            'foo': 'hoge',
            'bar': {
              'baz': 'fuga',
            }
          }
        END
        <<~END,
          {
            'hello': 'hoge',
            'bar': {
              'world': 'fuga',
            }
          }
        END
      ],
      [
        [
          ['foo' => 'hello'],
        ],
        <<~END,
          foo : bar
        END
        <<~END,
          hello : bar
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

      reversed_rewrited = klass.new(src, reverse: true).rewrite
      assert { reversed_rewrited == src }
    end
  end

  def test_rewriter_with_reverse
    klass = Class.new(YAMLRewriter::Rewriter) do
      define_rule ['foo', 'bar' => 'baz']
      define_rule ['hello' => 'world']
    end

    src = <<~END
      foo:
        baz: 42
      world:
        foo:
          baz: 424242
    END

    expected = <<~END
      foo:
        bar: 42
      hello:
        foo:
          bar: 424242
    END

    rewrited = klass.new(src, reverse: true).rewrite
    assert { rewrited == expected }
  end
end

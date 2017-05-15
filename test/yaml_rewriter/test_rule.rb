require 'test_helper'

class TestRule < Minitest::Test
  def test_rule_match
    rule = YAMLRewriter::Rule.new(['foo', 'bar' => 'baz'])
    assert { rule.match?(['foo', 'bar'], reverse: false) }
    assert { not rule.match?(['foo', 'baz'], reverse: false) }
  end

  def test_rule_match_with_reverse
    rule = YAMLRewriter::Rule.new(['foo', 'bar' => 'baz'])
    assert { not rule.match?(['foo', 'bar'], reverse: true) }
    assert { rule.match?(['foo', 'baz'], reverse: true) }
  end

  def test_rule_replacement
    rule = YAMLRewriter::Rule.new(['foo', 'bar' => 'baz'])
    assert { rule.replacement('bar', reverse: false) == 'baz' }
  end

  def test_rule_replacement_with_reverse
    rule = YAMLRewriter::Rule.new(['foo', 'bar' => 'baz'])
    assert { rule.replacement('baz', reverse: true) == 'bar' }
  end
end

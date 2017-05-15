require 'test_helper'

class TestRule < Minitest::Test
  def test_rule_match
    rule = YAMLRewriter::Rule.new(['foo', 'bar' => 'baz'])
    assert { rule.match?(['foo', 'bar']) }
  end

  def test_rule_replacement
    rule = YAMLRewriter::Rule.new(['foo', 'bar' => 'baz'])
    assert { rule.replacement('bar') == 'baz' }
  end
end

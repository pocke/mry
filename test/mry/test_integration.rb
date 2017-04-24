require 'test_helper'

class TestIntegration < Minitest::Test
  def test_without_args
    out = `mry`
    assert { !$?.success? }
    assert { out == Mry::CLI.__send__(:option).help }
  end
end

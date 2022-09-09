require 'test_helper'

class HelpersTest < Minitest::Test
  include SearchEngine::Helpers

  def test_benchmark
    duration = benchmark { sleep 0.2 }
    assert duration > 0.1
  end
end

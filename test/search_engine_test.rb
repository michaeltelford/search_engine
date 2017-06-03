require 'test_helper'

class SearchEngineTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SearchEngine::VERSION
  end
end

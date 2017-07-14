require 'test_helper'

class AppTest < Minitest::Test
  def test_version_number
    refute_nil SearchEngine::VERSION
  end
end

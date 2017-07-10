ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'byebug'

require_relative '../lib/search_engine'

# require the rack-test methods for all test files
class Minitest::Test
  include Rack::Test::Methods
end

# required by rack-test
def app
  SearchEngine::App.new
end

# helper methods for all tests go below...

def status
  last_response.status
end

def body
  last_response.body
end

def refute_empty_response
  assert_equal 200, status
  refute_empty body
end

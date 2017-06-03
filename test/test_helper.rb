$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'search_engine'

require 'minitest/autorun'
require 'rack/test'
require 'byebug'

# require the rack-test methods for all test files
class Minitest::Test
  include Rack::Test::Methods
end

# required by rack-test
def app
  Sinatra::Application
end

# helper methods for all tests go below...

def status
  last_response.status
end

def body
  last_response.body
end

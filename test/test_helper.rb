ENV['RACK_ENV'] ||= 'test'
$VERBOSE = nil # Turn off warnings.

require 'minitest/autorun'
require 'rack/test'
require 'slim'
require 'byebug'

require_relative '../lib/search_engine'

# Require any additional test methods for all tests.
class Minitest::Test
  include Rack::Test::Methods

  parallelize_me!
end

# Required by rack-test.
def app
  SearchEngine::App.new
end

# Helper methods for all tests go below...

def status
  last_response.status
end

def body
  last_response.body
end

def refute_empty_response
  assert last_response.ok?
  refute_empty body
end

# Renders a slim template and returns the HTML
#
# Params:
# template name string with or without .slim suffix
# env obj responding to .var e.g. OpenStruct or Class
def render_template(template, env)
  templates_dir = "lib/search_engine/views"
  template = "#{template}.slim" unless template.end_with? ".slim"
  template_path = "#{templates_dir}/#{template}"
  content = File.read(template_path)
  Slim::Template.new { content }.render(env)
end

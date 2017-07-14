ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'byebug'
require 'slim'

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
  assert last_response.ok?
  refute_empty body
end

# Renders a slim template and returns the HTML
#
# Params:
# template name string with or without .slim suffix
# env var responding to .value e.g. OpenStruct or Class
def render_template(template, env)
  templates_dir = "lib/search_engine/views"
  template = "#{template}.slim" unless template.end_with? ".slim"
  template_path = "#{templates_dir}/#{template}"
  content = File.read(template_path)
  Slim::Template.new { content }.render(env)
end

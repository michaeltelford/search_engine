require 'test_helper'

class SearchEngineTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil SearchEngine::VERSION
  end

  def test_not_found
    get '/doesnt_exist'
    assert_equal 404, status
    assert_equal "Not found, sorry!", body
  end

  def test_index
    get '/'
    assert_equal 302, status
    assert_equal "http://example.org/search", last_response.location
  end

  def test_search_without_query
    get '/search'
    assert_search_response
  end

  def test_search_with_query
    get '/search', { q: "Everest" }
    assert_search_response
    flunk "TODO: add search result assertions"
  end

  def assert_search_response
    assert_equal 200, status
    assert body.include? "Search Engine"
    assert body.include? "<input name=\"query\" type=\"text\" />"
    assert body.include? "<input type=\"submit\" value=\"Search\" />"
    assert body.include? "Copyright © 2017 Michael Telford"
  end
end

require 'test_helper'

class RoutesTest < Minitest::Test
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
    refute_empty_response
  end

  def test_search_with_query
    get '/search', { q: "Everest" }
    refute_empty_response
  end
end

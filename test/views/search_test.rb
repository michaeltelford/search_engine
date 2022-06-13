require 'test_helper'
require 'factories/mock_search_result'
require 'nokogiri'

class SearchViewTest < Minitest::Test
  TEMPLATE        = "search"
  CSS_QUERY       = "#q"
  CSS_NO_SEARCH   = "#no-search"
  CSS_NO_RESULTS  = "#no-results"
  CSS_RESULTS     = "#results > article.result"
  CSS_HEADLINE    = ".headline"
  CSS_KEYWORDS    = ".keywords"
  CSS_MATCH       = ".match"
  CSS_URL         = ".url"
  TEXT_SEARCH     = "Enter a Ruby related search query..."
  TEXT_NO_RESULTS = "There are no search results, try changing your query to something Ruby specific like \"Matz\"."

  def test_no_search
    q = ""
    mocks = []

    doc = search_template q: q, results: mocks
    results = doc.css CSS_RESULTS

    assert_equal 0, results.size
    assert_q q, doc
    assert_equal TEXT_SEARCH, doc.css(CSS_NO_SEARCH).text
  end

  def test_no_results
    q = "Jibberish"
    mocks = []

    doc = search_template q: q, results: mocks
    results = doc.css CSS_RESULTS

    assert_equal 0, results.size
    assert_q q, doc
    assert_equal TEXT_NO_RESULTS, doc.css(CSS_NO_RESULTS).text
  end

  def test_one_result
    q = "Everest"

    mocks = Array.new 1, MockSearchResult.new
    doc = search_template q: q, results: mocks
    results = doc.css CSS_RESULTS

    assert_equal 1, results.size
    assert_q q, doc
    assert_result mocks.first, results.first
  end

  def test_several_results
    num_results = 3
    q = "Ama Dablam"

    mocks = Array.new(num_results) { MockSearchResult.new }
    doc = search_template q: q, results: mocks
    results = doc.css CSS_RESULTS

    assert_equal num_results, results.size
    assert_q q, doc
    num_results.times { |i| assert_result mocks[i], results[i] }
  end

private

  # Sets up an env context to render the template with and returns a
  # Nokogiri::Document object from the resulting HTML.
  def search_template(env_hash)
    env = OpenStruct.new env_hash
    html = render_template TEMPLATE, env
    refute_empty html
    Nokogiri::HTML html
  end

  def assert_q(expected, actual)
    assert_equal expected, actual.css(CSS_QUERY).first[:value]
  end

  def assert_result(expected, actual)
    assert_equal expected.title, actual.css(CSS_HEADLINE).first.text
    if actual.css(CSS_KEYWORDS).first
      assert_equal expected.keywords, actual.css(CSS_KEYWORDS).first.text
    else
      assert_nil expected.keywords
    end
    assert_equal expected.text, actual.css(CSS_MATCH).first.text
    assert_equal expected.url, actual.css(CSS_URL).first.text
  end
end

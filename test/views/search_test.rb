require 'nokogiri'
require 'wgit'
require 'test_helper'

class SearchViewTest < Minitest::Test
  TEMPLATE = "search"
  RESULTS_CSS_SELECTOR = "#results > div.row"

  def test_no_results
    results = []
    doc = search_doc results
    results = doc.css RESULTS_CSS_SELECTOR
    assert_equal 0, results.size
  end

  def test_one_result
    results = [Wgit::Document]
    doc = search_doc results
    results = doc.css RESULTS_CSS_SELECTOR
    assert_equal 0, results.size
  end

  def test_several_results
    pass
  end

private

  # Sets up an env context to render the template with and returns a
  # Nokogiri::Document object from the resulting HTML
  def search_doc(results)
    env = OpenStruct.new results: results
    html = render_template TEMPLATE, env
    refute_empty html
    Nokogiri::HTML html
  end
end

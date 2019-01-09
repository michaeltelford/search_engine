require 'test_helper'
require 'sprockets-helpers'

class AssetsTest < Minitest::Test
  include Sprockets::Helpers

  # Asset helper method tests.

  def test_asset_stylesheets_helper
    assert respond_to? :stylesheet_tag
  rescue
    flunk "stylesheet_tag helper doesnt exist"
  end

  def test_asset_javascripts_helper
    assert respond_to? :javascript_tag
  rescue
    flunk "javascript_tag helper doesnt exist"
  end

  def test_asset_images_helper
    assert respond_to? :image_path
  rescue
    flunk "image_path helper doesnt exist"
  end

  # Asset route JS tests.

  def test_asset_app_js
    get '/assets/app.js'
    refute_empty_response
  end

  def test_asset_bootstrap_js
    get '/assets/bootstrap.js'
    refute_empty_response
  end

  def test_asset_jquery_js
    get '/assets/jquery.js'
    refute_empty_response
  end

  def test_asset_tether_js
    get '/assets/tether.js'
    refute_empty_response
  end

  # Asset route CSS tests.

  def test_asset_app_css
    get '/assets/app.css'
    refute_empty_response
  end

  def test_asset_bootstrap_css
    get '/assets/bootstrap.css'
    refute_empty_response
  end

  def test_asset_main_css
    get '/assets/main.css'
    assert last_response.ok?
  end

  def test_asset_search_css
    get '/assets/search.css'
    refute_empty_response
  end
end

require 'test_helper'
require 'sprockets-helpers'

class AssetsTest < Minitest::Test
  include Sprockets::Helpers

  # asset route tests
  def test_asset_app_js
    get '/assets/app.js'
    refute_empty_response
  end

  def test_asset_app_css
    get '/assets/app.css'
    refute_empty_response
  end

  def test_asset_sinatrarb_png
    get '/assets/sinatrarb.png'
    refute_empty_response
  end

  # asset helper tests
  def test_asset_app_css_helper
    refute_empty stylesheet_tag 'app'
  rescue
    flunk "image_path helper error"
  end

  def test_asset_app_js_helper
    refute_empty javascript_tag 'app'
  rescue
    flunk "image_path helper error"
  end

  def test_asset_sinatrarb_png_helper
    refute_empty image_path 'sinatrarb.png'
  rescue
    flunk "image_path helper error"
  end
end

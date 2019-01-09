require 'dotenv'
require 'thin'
require 'sinatra/base'
require 'slim'
require 'sprockets'
require 'sinatra/sprockets-helpers'
require 'uglifier'
require 'sass'
require 'coffee-script'
require 'execjs'
require 'wgit'
require_relative 'helpers'
require_relative 'search_result'

# Place any initialisation/configuration code in this file. The routes are
# required (loaded) at the bottom of this file once App init is complete.

module SearchEngine
  class App < Sinatra::Base
    puts "Running in #{environment} mode."
    Dotenv.load

    configure :development do
      require "sinatra/reloader"
      register Sinatra::Reloader
    end

    configure :development, :test do
      require 'byebug'
      require_relative '../../test/factories/mock_search_result'
    end

    configure :development, :production do
      enable :logging
      Wgit.set_connection_details_from_env
      set :db, Wgit::Database.new
      puts "Connected to the database successfully."
    end

    configure :development, :production, :test do
      register Sinatra::Sprockets::Helpers

      set :server, 'thin'
      set :sprockets, Sprockets::Environment.new(root)
      set :assets_dir, 'assets'
      set :assets_prefix, Proc.new { "/#{assets_dir}" }
      set :digest_assets, production?

      sprockets.append_path File.join(root, assets_dir, 'stylesheets')
      sprockets.append_path File.join(root, assets_dir, 'javascripts')
      sprockets.append_path File.join(root, assets_dir, 'images')

      sprockets.js_compressor  = :uglify
      sprockets.css_compressor = :scss

      configure_sprockets_helpers do |config|
        # Force debug mode when in development, which sets:
        # expand = true, digest = false, manifest = false
        config.debug = development?
      end
    end

    helpers SearchEngine::Helpers
  end
end

require_relative 'routes'

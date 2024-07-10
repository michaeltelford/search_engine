#!/usr/bin/env ruby
#
# Script to index webpages for the production Wgit demo search engine app.
# You must set the ENV["WGIT_CONNECTION_STRING"] value before running this script.
#

require "wgit"
require "wgit/core_ext"

raise "must set ENV['WGIT_CONNECTION_STRING']" unless ENV["WGIT_CONNECTION_STRING"]

Wgit.logger.level = Logger::WARN

# Needed for Document#nearest_fragment searches.
Wgit::Model.include_doc_html = true

pages = %w[
  https://rails.rubystyle.guide/
  https://github.com/rubocop/ruby-style-guide
  https://en.wikipedia.org/wiki/Ruby_(programming_language)
  https://www.ruby-lang.org/en/about/
  https://www.tutorialspoint.com/ruby/index.htm
].to_urls

indexer = Wgit::Indexer.new
indexer.index_urls(*pages, insert_externals: false) do |doc|
  if doc.empty?
    last_resp = indexer.crawler.last_response
    puts "Failed to index page: #{doc.url} - status: #{last_resp.status}"
  else
    puts "Indexed page successfully: #{doc.url}"
  end
end

puts "Script complete"

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_engine/version'

Gem::Specification.new do |spec|
  spec.name                 = "search_engine"
  spec.version              = SearchEngine::VERSION
  spec.authors              = ["Michael Telford"]
  spec.email                = ["michael.telford@live.com"]

  spec.summary              = "Search engine front end"
  spec.description          = "Search engine front end which utilises the 'wgit' gem as it's back end."
  spec.homepage             = "https://github.com/michaeltelford/search_engine"
  spec.license              = "MIT"
  spec.metadata["yard.run"] = "yri" # use "yard" to build full HTML docs.

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "nokogiri"

  spec.add_runtime_dependency "wgit"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "rack-protection"
  spec.add_runtime_dependency "thin"
  spec.add_runtime_dependency "sinatra"
  spec.add_runtime_dependency "sinatra-contrib"
  spec.add_runtime_dependency "slim"
  spec.add_runtime_dependency "sprockets"
  spec.add_runtime_dependency "sprockets-helpers"
  spec.add_runtime_dependency "uglifier"
  spec.add_runtime_dependency "execjs"
  spec.add_runtime_dependency "coffee-script"
  spec.add_runtime_dependency "sass"
end

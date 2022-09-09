# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_engine/version'

Gem::Specification.new do |spec|
  spec.name                 = "search_engine"
  spec.version              = SearchEngine::VERSION
  spec.author               = "Michael Telford"
  spec.email                = "michael.telford@live.com"

  spec.summary              = "Demo search engine web application."
  spec.description          = "Demo search engine which utilises the 'wgit' gem as its back end."
  spec.homepage             = "https://github.com/michaeltelford/search_engine"
  spec.license              = "MIT"
  spec.metadata["yard.run"] = "yri" # Use "yard" to build full HTML docs.

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

  spec.required_ruby_version = '~> 2.7' # Only works with ruby 3.0.x

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "yard", [">= 0.9.20", "< 1.0"]
  spec.add_development_dependency "pry"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "nokogiri"

  spec.add_runtime_dependency "bundler", "~> 2.0"
  spec.add_runtime_dependency "rake", "~> 13.0"
  spec.add_runtime_dependency "wgit", "~> 0.10"
  spec.add_runtime_dependency "dotenv", "~> 2.7"
  spec.add_runtime_dependency "rack", "~> 2.0"
  spec.add_runtime_dependency "rack-protection", "~> 2.0"
  spec.add_runtime_dependency "thin", "~> 1.7"
  spec.add_runtime_dependency "sinatra", "~> 2.2"
  spec.add_runtime_dependency "sinatra-contrib", "~> 2.0"
  spec.add_runtime_dependency "slim", "~> 4.0"
  spec.add_runtime_dependency "sprockets", "~> 3.7"
  spec.add_runtime_dependency "sprockets-helpers", "~> 1.2"
  spec.add_runtime_dependency "uglifier", "~> 4.1"
  spec.add_runtime_dependency "execjs", "~> 2.7"
  spec.add_runtime_dependency "coffee-script", "~> 2.4"
  spec.add_runtime_dependency "sass", "~> 3.7"
end

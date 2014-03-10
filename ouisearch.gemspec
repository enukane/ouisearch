# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ouisearch/version'

Gem::Specification.new do |spec|
  spec.name          = "ouisearch"
  spec.version       = Ouisearch::VERSION
  spec.authors       = ["n_kane"]
  spec.email         = ["enukane@glenda9.org"]
  spec.summary       = %q{Search for IEEE OUI list with given OUI}
  spec.description   = %q{Search for IEEE OUI list with given OUI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency 'httpclient'
end

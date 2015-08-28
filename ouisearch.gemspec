# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "ouisearch"
  spec.version       = "0.0.3"
  spec.authors       = ["Naoya kaneko"]
  spec.email         = ["enukane@glenda9.org"]
  spec.summary       = %q{Search for IEEE OUI list with given OUI (with local cache)}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/enukane/ouisearch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.has_rdoc      = false

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency 'faraday'
end

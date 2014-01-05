# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'diffbot/version'

Gem::Specification.new do |spec|
  spec.name          = "diffbot"
  spec.version       = Diffbot::VERSION
  spec.authors       = ["cenyongh"]
  spec.email         = ["cenyongh@gmail.com"]
  spec.description   = %q{ruby client for diffbot}
  spec.summary       = %q{ruby client for diffbot}
  spec.homepage      = "http://www.diffbot.com/products/automatic/classifier/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_runtime_dependency 'faraday'
end

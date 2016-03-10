# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-cisco-spark/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-cisco-spark"
  spec.version       = Omniauth::CiscoSpark::VERSION
  spec.authors       = ["Jordi Romero"]
  spec.email         = ["jordi@jrom.net"]

  spec.summary       = %q{OmniAuth strategy for Cisco Spark}
  spec.description   = %q{OmniAuth strategy for Cisco Spark}
  spec.homepage      = "https://github.com/jrom/omniauth-cisco-spark"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

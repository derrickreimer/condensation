# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'condensation/version'

Gem::Specification.new do |spec|
  spec.name          = 'condensation'
  spec.version       = Condensation::VERSION
  spec.authors       = ['Derrick Reimer']
  spec.licenses      = ['MIT']
  spec.email         = ['derrickreimer@gmail.com']
  spec.description   = 'A collection of handy extensions to the Liquid templating language'
  spec.summary       = 'Condensation is a collection of handy extensions to the Liquid templating language'
  spec.homepage      = 'https://github.com/djreimer/condensation'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'timecop'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'liquid', '~> 4.0.3'
  spec.add_dependency 'tzinfo', '~> 2'
  spec.add_dependency 'activesupport', '>= 3.0'
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'condensation/version'

Gem::Specification.new do |gem|
  gem.name          = "condensation"
  gem.version       = Condensation::VERSION
  gem.authors       = ["Derrick Reimer"]
  gem.email         = ["derrickreimer@gmail.com"]
  gem.description   = %q{A collection of handy extensions to the Liquid templating language}
  gem.summary       = %q{Condensation is a collection of handy extensions to the Liquid templating language}
  gem.homepage      = "https://github.com/djreimer/condensation"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "liquid", [">= 2.0", "<= 4.0"]
end

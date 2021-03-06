# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ember/middleman/version'

Gem::Specification.new do |spec|
  spec.name          = 'ember-middleman'
  spec.version       = Ember::Middleman::VERSION
  spec.authors       = ['Ryunosuke SATO']
  spec.email         = ['tricknotes.rs@gmail.com']
  spec.description   = %q{Ember for Middleman}
  spec.summary       = %q{Ember for Middleman}
  spec.homepage      = 'https://github.com/tricknotes/ember-middleman'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ember-handlebars-template', '~> 0.3.5'
  spec.add_dependency 'ember-source'
  spec.add_dependency 'ember-data-source'
  spec.add_dependency 'sass'
  spec.add_dependency 'middleman', '~> 3.0'
  spec.add_dependency 'middleman-sprockets', '~> 3.0'

  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'rake'
end

source 'https://rubygems.org'

gemspec

if ENV['EMBER_VERSION']
  gem 'ember-source', ENV['EMBER_VERSION']
end

gem 'execjs', '~> 2.5.0' # XXX To avoid failing features. In cucumber, `ENV['PATH']` is `nil` and raise `NoMethodError` at https://github.com/rails/execjs/blob/v2.6.0/lib/execjs/external_runtime.rb#L135.

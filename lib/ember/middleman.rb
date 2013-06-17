require 'middleman-core'

require 'ember/middleman/version'
require 'ember/middleman/templates'

module Ember
  module Middleman
    autoload :Extension, 'ember/middleman/extension'
  end
end

Middleman::Extensions.register :ember do
  ::Ember::Middleman::Extension
end

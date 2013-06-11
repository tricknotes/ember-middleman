require 'active_support/ordered_options'

require 'ember/middleman/handlebars/template'

require 'ember/source'
require 'ember/data/source'
require 'handlebars/source'

module Ember
  module Middleman
    module Extension
      class << self
        def registered(app)
          config = Ember::Middleman::Handlebars::Template.configuration

          config.precompile ||= true
          config.templates_root ||= 'templates'
          config.templates_path_separator ||= '/'

          yield config if block_given?

          app.before_configuration do
            template_extensions :handlebars => :javascript
          end

          app.after_configuration do
            sprockets.append_path ::Ember::Source.bundled_path_for(nil)
            sprockets.append_path ::Ember::Data::Source.bundled_path_for(nil)
            sprockets.append_path File.dirname(::Handlebars::Source.bundled_path)
          end

          Sprockets.register_engine '.handlebars', Ember::Middleman::Handlebars::Template
          Sprockets.register_engine '.hbs', Ember::Middleman::Handlebars::Template
          Sprockets.register_engine '.hjs', Ember::Middleman::Handlebars::Template
        end
      end
    end
  end
end

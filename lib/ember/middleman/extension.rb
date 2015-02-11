require 'active_support/ordered_options'

require 'ember/middleman/handlebars/template'

require 'ember/source'
require 'ember/data/source'

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
            template_extensions handlebars: :js,
                                hbs: :js,
                                hjs: :js
          end

          app.after_configuration do
            sprockets.append_path ::Ember::Source.bundled_path_for(nil)
            sprockets.append_path ::Ember::Data::Source.bundled_path_for(nil)
            sprockets.append_path File.dirname(::Handlebars::Source.bundled_path) if defined?(::Handlebars)

            sprockets.register_engine '.handlebars', Ember::Middleman::Handlebars::Template
            sprockets.register_engine '.hbs', Ember::Middleman::Handlebars::Template
            sprockets.register_engine '.hjs', Ember::Middleman::Handlebars::Template
          end

          ::Tilt.register '.handlebars', Ember::Middleman::Handlebars::Template
          ::Tilt.register '.hbs', Ember::Middleman::Handlebars::Template
          ::Tilt.register '.hjs', Ember::Middleman::Handlebars::Template
        end
      end
    end
  end
end

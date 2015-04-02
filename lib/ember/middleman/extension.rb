require 'active_support/ordered_options'

require 'ember/handlebars/template'

require 'ember/source'
require 'ember/data/source'

begin
  require 'handlebars/source'
rescue LoadError => e
  raise e unless e.message == 'cannot load such file -- handlebars/source'
end

module Ember
  module Middleman
    module Extension
      class << self
        def registered(app)
          Ember::Handlebars::Template.configure do |config|
            config.precompile = true
            config.templates_root = 'templates'
            config.templates_path_separator = '/'

            yield config if block_given?
          end

          app.before_configuration do
            template_extensions handlebars: :js,
                                hbs: :js,
                                hjs: :js
          end

          app.after_configuration do
            sprockets.append_path ::Ember::Source.bundled_path_for(nil)
            sprockets.append_path ::Ember::Data::Source.bundled_path_for(nil)
            sprockets.append_path File.dirname(::Handlebars::Source.bundled_path) if defined?(::Handlebars)

            sprockets.register_engine '.handlebars', Ember::Handlebars::Template
            sprockets.register_engine '.hbs', Ember::Handlebars::Template
            sprockets.register_engine '.hjs', Ember::Handlebars::Template
          end

          ::Tilt.register '.handlebars', Ember::Handlebars::Template
          ::Tilt.register '.hbs', Ember::Handlebars::Template
          ::Tilt.register '.hjs', Ember::Handlebars::Template
        end
      end
    end
  end
end

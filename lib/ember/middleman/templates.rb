require 'middleman-core/templates'

module Ember
  module Middleman
    class Templates < ::Middleman::Templates::Base
      class_option 'css_dir',
        :default => 'stylesheets',
        :desc    => 'The path to the css files'

      class_option 'js_dir',
        default: 'javascripts',
        desc:    'The path to the javascript files'

      class_option 'images_dir',
        :default => 'images',
        :desc    => 'The path to the image files'

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end

      def build_scaffold
        template 'config.tt', File.join(location, 'config.rb')

        empty_directory File.join(location, 'source', options[:css_dir])
        empty_directory File.join(location, 'source', options[:images_dir])

        js_dir = File.join(location, 'source', options[:js_dir])

        directory File.join('source', 'javascripts'), js_dir

        empty_directory File.join(js_dir, 'models')
        empty_directory File.join(js_dir, 'controllers')
        empty_directory File.join(js_dir, 'helpers')
        empty_directory File.join(js_dir, 'views')
        empty_directory File.join(js_dir, 'templates')
        empty_directory File.join(js_dir, 'routes')

        %w(
          source/layouts/layout.html.erb
          source/index.html.erb
          source/javascripts/templates/index.js.handlebars
        ).each do |file|
          copy_file file, File.join(location, file)
        end
      end
    end
  end
end

Middleman::Templates.register(:ember, Ember::Middleman::Templates)

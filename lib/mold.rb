# CodeKit needs relative paths
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require "mold/generator"

unless defined?(Sass)
  require 'sass'
end

module Mold
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require 'mold/engine'
    end

    module Rails
      class Railtie < ::Rails::Railtie
        rake_tasks do
          #load "tasks/install.rake"
        end
      end
    end
  else
    Sass.load_paths << File.expand_path("../../app/assets/stylesheets", __FILE__)
  end
end

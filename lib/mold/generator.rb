require 'mold/version'
require 'thor'
require 'fileutils'

module Mold
  class Generator < Thor
    map ['-v', '--version'] => :version
    map ['-l', '--layout'] => :layout

    desc 'version', 'Show Mold version'
    def version
      say "Mold #{Mold::VERSION}"
    end

    desc 'layout', 'Copy Mold admin layout'
    def layout
      copy_files '/templates/admin', 'app/views/'
      copy_files '/templates/layouts/admin.html.erb', 'app/views/layouts'
      say "Copied files to app/views/"
      say "Don't forget to add mold.scss to your precompile list for production"
    end

    private

    def copy_files(source, destination)
      FileUtils.cp_r(File.join(top_level_directory, source), destination)
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end

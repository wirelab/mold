require 'mold/version'
require 'thor'

module Mold
  class Generator < Thor
    map ['-v', '--version'] => :version

    desc 'version', 'Show Mold version'
    def version
      say "Mold #{Mold::VERSION}"
    end
  end
end

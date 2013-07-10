# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mold/version"

Gem::Specification.new do |s|
  s.name        = "mold"
  s.version     = Mold::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wirelab"]
  s.email       = ["info@wirelab.nl"]
  s.homepage    = "https://github.com/wirelab/mold"
  s.summary     = "Styling library for admin interfaces"
  s.description = <<-DESC
Mold is a simple collection of default stylesheets and re-usable elements for molding
admin interfaces to suite our taste
  DESC

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('sass', '>= 3.2.0')
  s.add_dependency('thor')

  s.add_development_dependency('rake')
end


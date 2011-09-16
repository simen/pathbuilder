# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pathbuilder/version"

Gem::Specification.new do |s|
  s.name        = "pathbuilder"
  s.version     = Pathbuilder::VERSION
  s.authors     = ["Simen Svale Skogsrud"]
  s.email       = ["simen@bengler.no"]
  s.homepage    = ""
  s.summary     = %q{A class for building restful urls in a ruby-methodic way}
  s.description = %q{A class for building restful urls in a ruby-methodic way}

  s.rubyforge_project = "pathbuilder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  
end

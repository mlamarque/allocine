# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "allocine/version"

Gem::Specification.new do |s|
  s.name        = "allocine"
  s.version     = Allocine::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthieu Lamarque"]
  s.email       = ["lamarque.matthieu@gmail.com"]
  s.homepage    = "http://github.com/mlamarque/allocine"
  s.summary     = %q{Easily access the publicly available information on Allocine website.}
  s.description = %q{Easily use Ruby to find information on allocine website.}

  s.rubyforge_project = "allocine"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'hpricot', '~> 0.8.4'

  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rspec', '~> 1.3.2'
end

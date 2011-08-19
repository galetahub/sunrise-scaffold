# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunrise/scaffold/version"

Gem::Specification.new do |s|
  s.name = "sunrise-scaffold"
  s.version = Sunrise::Scaffold::VERSION.dup
  s.platform = Gem::Platform::RUBY 
  s.summary = "Rails CMS"
  s.description = "Sunrise is a Aimbulance CMS"
  s.authors = ["Igor Galeta", "Pavlo Galeta"]
  s.email = "galeta.igor@gmail.com"
  s.rubyforge_project = "sunrise-core"
  s.homepage = "https://github.com/galetahub/sunrise-scaffold"
  
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.test_files = Dir["{test}/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
end

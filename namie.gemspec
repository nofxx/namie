# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'namie/version'

Gem::Specification.new do |s|
  s.name        = 'namie'
  s.version     = Namie::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Marcos Piccinini']
  s.email       = ['nofxx@github.com']
  s.homepage    = 'http://github.com/nofxx/namie'
  s.summary     = 'Area codes for phonie'
  s.description = 'Area codes for phonie'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rake'
end

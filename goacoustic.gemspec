# encoding: utf-8
require File.expand_path('../lib/acoustic/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'addressable', '~> 2.7'
  gem.add_dependency 'faraday', '~> 1.0'
  gem.add_dependency 'faraday_middleware', '~> 1.0'
  gem.add_dependency 'hashie', '~> 4.0'
  gem.add_dependency 'builder', '~> 3.2'
  gem.add_dependency 'multi_xml', '~> 0.6'
  gem.add_development_dependency 'oauth2'
  gem.add_development_dependency 'rdiscount'
  gem.add_development_dependency 'yard'
  gem.author      = "Adam Anderson, Upworthy"
  gem.description = %q{A Ruby wrapper for the Acoustic API}
  gem.email       = 'adam.anderson@harman.com'
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files       = `git ls-files`.split("\n")
  gem.homepage    = 'http://www.github.com/harman-signal-processing/goacoustic'
  gem.licenses    = ['BSD-3-Clause']
  gem.name        = 'goacoustic'
  gem.require_paths = ['lib']
  gem.summary     = gem.description
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version     = Acoustic::VERSION
end

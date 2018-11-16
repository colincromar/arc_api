# -*- encoding: utf-8 -*-
# spec/fixtures/bearcat.jpg Attribution: TassiloRau at the German language Wikipedia
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arc_api/version'

Gem::Specification.new do |gem|
  gem.authors =       ['Colin Cromar']
  gem.email =         ['colincromar@gmail.com']
  gem.description =   %q{Ruby interface for interacting with the Arc API}
  gem.summary =       %q{Canvas API}

  gem.files = %w[Rakefile arc_api.gemspec]
  gem.files += Dir.glob('lib/**/*.rb')
  gem.files += Dir.glob('spec/**/*')
  gem.test_files    = Dir.glob('spec/**/*')
  gem.name          = 'arc_api'
  gem.require_paths = ['lib']
  gem.version       = ArcApi::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler', '>= 1.0.0'
  gem.add_development_dependency 'rspec', '>= 3.0'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'pry'

  gem.add_dependency 'footrest', '>= 0.5.1'
end

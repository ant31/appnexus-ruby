require 'rake'
require 'date'
require File.join(File.dirname(__FILE__), 'lib/appnexus/version')

Gem::Specification.new do |s|
  s.name = 'appnexus'
  s.version = ::AppNexus::VERSION
  s.licenses = ['MIT']
  s.date = Date.today.to_s
  s.summary = 'A Ruby wrapper for the AppNexus API'
  s.description = 'appnexus is a Ruby library for interacting with the AppNexus API.'
  s.homepage = 'http://github.com/antlegrand/openapi-appnexus'
  s.authors = ['Antoine Legrand']
  s.email = ['ant.legrand@gmail.com']
  s.files = FileList['README.md', 'License', 'Changelog','Rakefile', 'lib/**/*.rb'].to_a
  s.test_files = FileList['spec/**/*.rb'].to_a

  s.add_dependency 'json', [ ">=1.8.1" ]
  s.add_dependency 'openapi', [ ">=0" ]
  s.add_dependency 'dalli', [ "~> 2.7" ]
  s.add_dependency 'virtus', [ "~> 1" ]

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakeweb'

  s.required_ruby_version = '>= 1.9.2'
end

require 'rake'

Gem::Specification.new do |s|
  s.name = 'dohutil'
  s.version = '0.2.36'
  s.summary = 'assorted tiny utilities'
  s.description = "Tiny utilities, packaged together so they don't each have their own gem."
  s.require_path = 'lib'
  s.required_ruby_version = '>= 2.2.0'
  s.add_runtime_dependency 'dohroot', '~> 0.1', '>= 0.1.7'
  s.add_runtime_dependency 'highline', '~> 1.7', '>= 1.7.8'
  s.add_development_dependency 'dohtest', '~> 0.1', '>= 0.1.48'
  s.authors = ['ATPSoft']
  s.bindir = 'bin'
  s.homepage = 'https://github.com/atpsoft/dohutil'
  s.license = 'MIT'
  s.email = ['devinfo@atpsoft.com']
  s.extra_rdoc_files = ['MIT-LICENSE']
  s.test_files = FileList["{test}/**/*.rb"].to_a
  s.files = FileList["{lib,test}/**/*"].to_a
end

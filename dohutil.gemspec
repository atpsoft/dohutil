require 'rake'

Gem::Specification.new do |s|
  s.name = 'dohutil'
  s.version = '0.1.3'
  s.summary = 'assorted tiny utilities'
  s.description = "Tiny utilities, packaged together so they don't each have their own gem."
  s.require_path = 'lib'
  s.required_ruby_version = '>= 1.9.2'
  s.authors = ['Makani Mason', 'Kem Mason']
  s.bindir = 'bin'
  s.homepage = 'https://github.com/atpsoft/dohutil'
  s.license = 'MIT'
  s.email = ['devinfo@atpsoft.com']
  s.extra_rdoc_files = ['MIT-LICENSE']
  s.files = FileList["{lib}/**/*"].to_a
end

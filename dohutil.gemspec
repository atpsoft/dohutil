require 'rake'

Gem::Specification.new do |s|
  s.name = 'dohutil'
  s.version = '0.1.1'
  s.summary = 'Tiny utilities, packaged together for convenience.'
  s.description = %q{
  This is a collection of tiny utilities, for a variety of purposes.
  Originally built to support other doh* gems, such as dohtest, but
  designed in a way that hopefully makes them more generally useful.
  }
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

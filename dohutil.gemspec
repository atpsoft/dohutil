require 'rake'

Gem::Specification.new do |s|
  s.name = 'dohutil'
  s.version = '0.1.0'
  s.summary = 'Tiny standalone utilities, packaged together for convenience.'
  s.description = 'This is a collection of tiny standalone utilities, built primarily to support other doh* gems (note the gems that are dependent on dohutil), but designed in a way that hopefully makes them more generally useful.'
  s.require_path = 'lib'
  s.required_ruby_version = '>= 1.9.2'
  s.authors = ['Makani Mason', 'Kem Mason']
  s.bindir = 'bin'
  s.homepage = 'https://github.com/pquimo/dohutil'
  s.license = 'MIT'
  s.email = ['gitauthor@pqmland.com']
  s.extra_rdoc_files = ['MIT-LICENSE']
  s.files = FileList["{lib}/**/*"].to_a
end

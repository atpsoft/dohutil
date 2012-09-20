require 'doh/root'

module DohApp

def self.require_custom_config
  raise Doh::DohRootNotFoundException if !Doh::root
  path = File.expand_path(File::join(Doh::root, 'config/dohapp.rb'))
  require(path) if File.exist?(path)
end

def self.init_from_file(filepath)
  Doh::find_root_from_file(filepath)
  DohApp::require_custom_config
end

end

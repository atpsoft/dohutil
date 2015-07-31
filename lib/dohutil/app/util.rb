require 'dohroot'

module DohApp
extend self

def require_custom_config
  raise "Doh.root not found" if !Doh.root
  path = File.expand_path(File.join(Doh.root, 'config/dohapp.rb'))
  require(path) if File.exist?(path)
end

def init_from_file(filepath)
  Doh.find_root_from_file(filepath)
  DohApp.require_custom_config
end

end

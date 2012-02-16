require 'doh/root'
require 'doh/core_ext/kernel'

module DohApp

def self.require_custom_config
  require_optional(File::join(Doh::root, 'config/dohapp'))
end

def self.init_from_file(filepath)
  Doh::find_root_from_file(filepath)
  DohApp::require_custom_config
end

end

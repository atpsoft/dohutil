require 'doh/root'
require 'doh/core_ext/kernel'

module Doh

def self.require_dohapp_config
  require_optional(File::join(Doh::root, 'config/dohapp'))
end

end

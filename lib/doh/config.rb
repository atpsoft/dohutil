require 'doh/root'

module Doh

def self.load_config_file(name)
  path = File.join(Doh::root, 'config', name) + '.rb'
  return false unless File.exist?(path)
  require(path)
  true
end

def self.config
  @config ||= {}
end

def self.get_required_config_value(value, desc)
  raise "Attempt to get configuration value: #{value.inspect}, but none exists.  #{desc}" if !config.key?(value)
  config[value]
end

end

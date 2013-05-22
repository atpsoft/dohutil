module Doh
extend self
ENV_PREFIXES = %w(DOH RACK RAILS).freeze

def env
  @env ||= find_env
end

def find_env
  ENV_PREFIXES.each do |prefix|
    denval = ENV["#{prefix}_ENV"]
    return denval if denval
  end
  raise 'please set DOH_ENV, RACK_ENV or RAILS_ENV'
end

end

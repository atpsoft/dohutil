module Doh
  DEFAULT_ENV_PREFIXES = %w(DOH RACK RAILS)

  def self.env
    @env ||= (find_env || 'development')
  end

  def self.find_env(prefixes = nil)
    retval = nil
    (prefixes || DEFAULT_ENV_PREFIXES).each do |elem|
      retval = ENV["#{elem}_ENV"]
      break if retval
    end
    retval
  end
end

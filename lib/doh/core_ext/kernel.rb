module Kernel

def require_optional(string)
  require(string)
rescue LoadError => ignore
end

end

module Doh

def self.class_basename(klass)
  full_name = klass.to_s
  retval = full_name.rpartition('::').last
  retval = full_name if retval.empty?
  retval
end

end

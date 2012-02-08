module Doh

def self.array_to_hash(ary)
  retval = {}
  ary.each do |elem|
    key, value = yield(elem)
    retval[key] = value
  end
  retval
end

end

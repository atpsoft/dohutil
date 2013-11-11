module Doh
extend self

def disable_verbose
  old_verbose = $VERBOSE
  $VERBOSE = false
  yield
ensure
  $VERBOSE = old_verbose
end

end

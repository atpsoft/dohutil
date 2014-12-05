def errors_matching(&block)
  m = Module.new
  (class << m; self; end).instance_eval do
    define_method(:===, &block)
  end
  m
end

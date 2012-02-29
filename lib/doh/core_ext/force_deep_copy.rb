class Class
  def force_deep_copy(*syms)
    return if syms.empty?
    code = "def initialize_copy(orig); "
    code << "super(orig)\n "
    syms.each do |elem|
      code << "@#{elem} = @#{elem}.nil? ? nil : @#{elem}.dup\n "
    end
    code << "end\n"
    class_eval(code)
  end
end

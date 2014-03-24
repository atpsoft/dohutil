module Kernel
  def enum(*syms)
    syms.each { |elem| const_set(elem, elem.to_s) }
  end
end

require 'set'

class Array
  def include_any?(ary)
    !self.to_set.intersection(ary.to_set).empty?
  end

  def include_all?(ary)
    self.to_set.superset?(ary.to_set)
  end
end

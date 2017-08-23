class NilClass
  def empty?
    return true
  end
end

class Numeric
  def empty?
    return false
  end
end

class Date
  def empty?
    return false
  end
end

class Time
  def empty?
    return false
  end
end

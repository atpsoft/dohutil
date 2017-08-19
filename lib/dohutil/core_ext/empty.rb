class NilClass
  def empty?
    return true
  end
end

class Fixnum
  def empty?
    return false
  end
end

class Date
  def empty?
    return false
  end
end

class DateTime
  def empty?
    return false
  end
end

class Time
  def empty?
    return false
  end
end

class BigDecimal
  def empty?
    return false
  end
end

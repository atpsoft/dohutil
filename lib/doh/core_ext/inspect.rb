require 'date'
require 'bigdecimal'

class Date
  undef inspect
  def inspect
    "#<Date:#{strftime('%F')}>"
  end
end

class DateTime
  undef inspect
  def inspect
    "#<DateTime:#{strftime('%F %X %z')}>"
  end
end

class Time
  undef inspect
  def inspect
    "#<Time:#{strftime('%F %X %z')}>"
  end
end

class BigDecimal
  undef inspect
  def inspect
    "#<BigDecimal:#{to_s('F')}>"
  end
end

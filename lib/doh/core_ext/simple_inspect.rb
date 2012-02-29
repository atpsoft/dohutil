require 'date'
require 'bigdecimal'

class Date
  def inspect
    "#<Date:#{strftime('%F')}>"
  end
end

class DateTime
  def inspect
    "#<DateTime:#{strftime('%F %X %z')}>"
  end
end

class Time
  def inspect
    "#<Time:#{strftime('%F %X %z')}>"
  end
end

class BigDecimal
  def inspect
    "#<BigDecimal:#{to_s('F')}>"
  end
end

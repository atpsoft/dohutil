require 'date'

class Date
  def self.days_in_month(year, month)
    civil(year, month, -1).mday
  end

  undef inspect
  def inspect
    strftime('%F')
  end

  def weekday?
    (wday > 0) && (wday < 6)
  end

  def make_datetime(hour = 0, minute = 0, second = 0, offset = 0)
    DateTime.new(year, month, mday, hour, minute, second, offset)
  end
end

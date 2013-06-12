require 'date'
require 'time'

class Date
  def self.days_in_month(year, month)
    civil(year, month, -1).mday
  end

  def weekday?
    (wday > 0) && (wday < 6)
  end

  def make_datetime(hour = 0, minute = 0, second = 0, offset = 0)
    DateTime.new(year, month, mday, hour, minute, second, offset)
  end

  def make_local_datetime(hour = 0, minute = 0, second = 0)
    DateTime.local(year, month, mday, hour, minute, second)
  end
end

class DateTime
  def self.local(year, month, day, hour = 0, minute = 0, second = 0)
    Time.local(year, month, day, hour, minute, second).to_datetime
  end
end

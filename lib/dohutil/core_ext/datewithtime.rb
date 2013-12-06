require 'date'
require 'time'

class DateTime
  DAY_SECONDS = 60 * 60 * 24

  def self.zow
    obj = now
    new(obj.year, obj.month, obj.mday, obj.hour, obj.min, obj.sec, 0)
  end

  def self.seconds_to_days(seconds)
    seconds.to_f / DAY_SECONDS.to_f
  end

  def next_second(n = 1)
    self + self.class.seconds_to_days(n)
  end

  def prev_second(n = 1)
    next_second(-n)
  end

  # subtract another DateTime object, return difference in seconds
  def sub_dt(other)
    ((self - other) * DAY_SECONDS).to_i
  end
end

class Time
  def self.zow
    obj = now
    new(obj.year, obj.month, obj.mday, obj.hour, obj.min, obj.sec, 0)
  end

  def next_second(n = 1)
    self + n
  end

  def prev_second(n = 1)
    self - n
  end
end

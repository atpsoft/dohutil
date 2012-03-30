require 'date'
require 'time'

class DateTime
  DOHRUBY_SECONDS_IN_DAY = (24 * 60 * 60).freeze

  def self.zow
    obj = now
    new(obj.year, obj.month, obj.mday, obj.hour, obj.min, obj.sec, 0)
  end

  def self.seconds_to_days(seconds)
    seconds.to_f / DOHRUBY_SECONDS_IN_DAY.to_f
  end

  def next_second(n = 1)
    self + (SECONDS_IN_DAY * n)
  end

  def prev_second(n = 1)
    next_second(-n)
  end

  # subtract another DateTime object, return difference in seconds
  def sub_dt(other)
    ((self - other) * DOHRUBY_SECONDS_IN_DAY).to_i
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

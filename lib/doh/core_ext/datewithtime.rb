require 'date'
require 'time'

# these are sets of methods to make DateTime & Time objects more interchangeable
# they are not comprehensive, nor exact - for example, this DateTime utc method does not modify the receiver, whereas the Time utc method does
# they simply provide good enough compatibility for what I've encountered so far
module MakeDateTimeLikeTime
  def utc
    new_offset
  end
end

module MakeTimeLikeDateTime
  def next_second(n = 1)
    self + n
  end

  def prev_second(n = 1)
    self - n
  end
end

class DateTime
  include MakeDateTimeLikeTime

  DOHRUBY_SECONDS_IN_DAY = (24 * 60 * 60).freeze

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
  include MakeTimeLikeDateTime
end

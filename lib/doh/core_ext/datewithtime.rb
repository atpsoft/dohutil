require 'date'
require 'time'

# these are a set of methods to make DateTime objects more interchangeable with Time objects
# they are not comprehensive, nor exact - for example, this utc method does not modify the receiver, whereas the Time equivalent does
# they simply provide good enough compatibility for what I've encountered so far
module MakeDateTimeLikeTime
  def utc
    new_offset
  end
end

class DateTime
  include MakeDateTimeLikeTime

  DOHRUBY_SECONDS_IN_DAY = (24 * 60 * 60).freeze

  def self.seconds_to_days(seconds)
    seconds.to_f / DOHRUBY_SECONDS_IN_DAY.to_f
  end

  def inspect
    strftime('%F %X')
  end

  def add_seconds(seconds)
    self + Rational(seconds, DOHRUBY_SECONDS_IN_DAY)
  end

  def sub_seconds(seconds)
    add_seconds(-seconds)
  end

  # subtract another DateTime object, return difference in seconds
  def sub_dt(other)
    ((self - other) * DOHRUBY_SECONDS_IN_DAY).to_i
  end
end

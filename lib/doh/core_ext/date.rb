require 'date'
require 'time'

class Date
  def self.days_in_month(year, month)
    civil(year, month, -1).mday
  end

  def self.smart_parse(datestr)
    if datestr =~ /\A(\d\d)\/(\d\d)\/(\d\d)\z/
      month = $1.to_i
      mday = $2.to_i
      year = $3.to_i
      result = Date.new(year, month, mday)
    else
      result = Date.parse(datestr)
    end

    if result.year < 50
      result = Date.new(result.year + 2000, result.month, result.day)
    elsif result.year < 100
      result = Date.new(result.year + 1900, result.month, result.day)
    end
    result
  end

  undef inspect
  def inspect
    strftime('%F')
  end

  def weekday?
    (wday > 0) && (wday < 6)
  end

  def self.short_weekday_to_num(weekday)
    @@short_days_of_week ||= Time::RFC2822_DAY_NAME.collect {|day| day.downcase}
    @@short_days_of_week.index(weekday.downcase)
  end

  def years_since(date)
    years_diff = year - date.year
    if month < date.month || (month == date.month && day < date.day)
      years_diff -= 1
    end
    years_diff
  end

  def add_months(months, new_day = nil)
    total_month = month + months
    new_month = total_month % 12
    new_month = 12 if new_month == 0
    new_year = year + ((total_month - 1) / 12)
    calc_day = [mday, Date.days_in_month(new_year, new_month)].min
    Date.new(new_year, new_month, new_day || calc_day)
  end

  def add_years(years)
    new_year = year + years
    calc_day = [mday, Date.days_in_month(new_year, month)].min
    Date.new(new_year, month, calc_day)
  end
end

class DateTime
  DOHRUBY_SECONDS_IN_DAY = (24 * 60 * 60).freeze

  def self.seconds_to_days(seconds)
    seconds.to_f / DOHRUBY_SECONDS_IN_DAY.to_f
  end

  def self.zow
    obj = now
    new(obj.year, obj.month, obj.mday, obj.hour, obj.min, obj.sec)
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

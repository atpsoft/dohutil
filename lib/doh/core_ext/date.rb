require 'date'

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
end

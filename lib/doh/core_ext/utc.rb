require 'doh/core_ext/datewithtime'

class Date
  def self.utcday
    Time.now.utc.to_date
  end
end

class DateTime
  def self.utcnow
    now.utc
  end
end

class Time
  def self.utcnow
    now.utc
  end
end

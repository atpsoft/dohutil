require 'doh/core_ext/bigdecimal'

class Object
  def to_display
    to_s
  end
end

class DateTime
  def to_display
    strftime('%m/%d/%Y %I:%M%P')
  end
end

class Time
  def to_display
    strftime('%m/%d/%Y %I:%M%P')
  end
end

class Date
  def to_display
    strftime('%m/%d/%Y')
  end
end

class TrueClass
  def to_display
    'yes'
  end
end

class FalseClass
  def to_display
    'no'
  end
end

class BigDecimal
  def to_display
    '$' + to_dig(2)
  end
end

class PhoneDisplayString < String
  def to_display
    Doh::display_phone(self)
  end

  def to_s
    self
  end
end

class PostalDisplayString < String
  def to_display
    Doh::display_postal(self)
  end

  def to_s
    self
  end
end

class SsnDisplayString < String
  def to_display
    Doh::display_ssn(self)
  end

  def to_s
    self
  end
end

module Doh

def self.display_phone(str)
  return str unless str.size == 10
  str[0..2] + '-' + str[3..5] + '-' + str[6..9]
end

def self.display_postal(str)
  return str unless str.size == 9
  return str[0..4] + '-' + str[5..8]
end

def self.display_ssn(str)
  return str unless str.size == 9
  str[0..2] + '-' + str[3..4] + '-' + str[5..8]
end

end

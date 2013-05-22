require 'dohutil/core_ext/bigdecimal'

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

module Doh
extend self

def display_phone(str, html_format = false)
  return str unless str.to_s.size == 10
  formatted = "#{str[0..2]}-#{str[3..5]}-#{str[6..9]}"
  if html_format
    "<a href='callto:+1#{formatted}'>#{formatted}</a>"
  else
    formatted
  end
end

def display_postal(str)
  return str unless str.to_s.size == 9
  return str[0..4] + '-' + str[5..8]
end

def display_ssn(str)
  return str unless str.to_s.size == 9
  str[0..2] + '-' + str[3..4] + '-' + str[5..8]
end

end

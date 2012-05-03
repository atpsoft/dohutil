require 'bigdecimal'
require 'bigdecimal/util'

class Integer
  # to_d is already defined in 1.9.3
  unless method_defined?(:to_d)
    puts "defining Integer.to_d"
    def to_d
      to_s.to_d
    end
  end
end

class BigDecimal
  # to_d is already defined in 1.9.3
  unless method_defined?(:to_d)
    puts "defining BigDecimal.to_d"
    def to_d
      self
    end
  end

  alias :_doh_original_to_s :to_s
  def to_s(format = 'F')
    _doh_original_to_s(format)
  end

  def to_dig(digits_after_decimal = 2)
    raise ArgumentError.new("digits_after_decimal must be > 0") unless digits_after_decimal > 0
    return '0.' + ('0' * digits_after_decimal) if nan? || infinite?

    retval = truncate(digits_after_decimal).to_s('F')
    digits_needed = retval.index('.') + digits_after_decimal + 1 - retval.size
    retval += ('0' * digits_needed) if digits_needed > 0

    retval
  end
end

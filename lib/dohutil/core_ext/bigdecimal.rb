require 'bigdecimal'
require 'bigdecimal/util'

class Integer
  if !method_defined?(:to_d)
    def to_d
      BigDecimal(self)
    end
  end
end

class BigDecimal
  if !method_defined?(:to_d)
    def to_d
      self
    end
  end

  alias :_doh_original_to_s :to_s
  def to_s(format = 'F')
    _doh_original_to_s(format)
  end

  def to_dig(digits_after_decimal = 2)
    raise ArgumentError.new("digits_after_decimal must be >= 0") if digits_after_decimal < 0
    if nan? || infinite?
      return '0' if digits_after_decimal == 0
      return '0.' + ('0' * digits_after_decimal)
    end

    if digits_after_decimal == 0
      return to_i.to_s
    end

    retval = truncate(digits_after_decimal).to_s('F')
    digits_needed = retval.index('.') + digits_after_decimal + 1 - retval.size
    retval += ('0' * digits_needed) if digits_needed > 0

    retval
  end
end

class NilClass
  NIL_ZERO_BIGD = BigDecimal(0)

  def to_d
    NIL_ZERO_BIGD
  end
end

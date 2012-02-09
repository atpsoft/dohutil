require 'bigdecimal'

class Integer
  def to_d
    to_s.to_d
  end
end

class BigDecimal
  alias :_original_to_s :to_s
  def to_s(format = 'F')
    _original_to_s(format)
  end

  undef inspect
  def inspect
    to_s
  end

  def to_d
    self
  end

  def to_dig(digits_after_decimal = 2)
    raise ArgumentError.new("digits_after_decimal must be > 0") unless digits_after_decimal > 0
    return '0.' + ('0' * digits_after_decimal) if nan? || infinite?

    retval = truncate(digits_after_decimal).to_s
    digits_needed = retval.index('.') + digits_after_decimal + 1 - retval.size
    retval += ('0' * digits_needed) if digits_needed > 0

    retval
  end
end

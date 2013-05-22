require 'dohutil/core_ext/bigdecimal'

module Doh

class Test_core_ext_bigdecimal < DohTest::TestGroup
  def test_to_dig_valid
    assert_equal('0.00', BigDecimal('0').to_dig)
    assert_equal('1.00', BigDecimal('1').to_dig)
    assert_equal('1.10', BigDecimal('1.1').to_dig)
    assert_equal('1.11', BigDecimal('1.11134').to_dig)
    assert_equal('1.111', BigDecimal('1.1113456').to_dig(3))
  end

  def test_to_dig_errors
    assert_raises(ArgumentError) { BigDecimal('1').to_dig(-1) }
    assert_equal('0.00', BigDecimal('NaN').to_dig)
    assert_equal('0.00', BigDecimal('Infinity').to_dig)
    assert_equal('0.00', BigDecimal('blah').to_dig)
    assert_equal('0', BigDecimal('NaN').to_dig(0))
    assert_equal('1', BigDecimal('1').to_dig(0))
    assert_equal('0', BigDecimal('blah').to_dig(0))
  end

  def test_to_dig_doesnt_modify
    bd = BigDecimal('1.11134')
    assert_equal('1.11134', bd.to_s)
    assert_equal('1.11', bd.to_dig)
    assert_equal('1.11134', bd.to_s)
  end
end

end

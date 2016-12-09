require 'dohutil/core_ext/blank'

module Doh

class Test_core_ext_blank < DohTest::TestGroup
  def test_blank
    assert_equal(true, ''.blank?)
    assert_equal(false, ' '.blank?)
    assert_equal(true, nil.blank?)
    assert_equal(true, {}.blank?)
    assert_equal(true, [].blank?)
  end
end

end

require 'dohutil/core_ext/empty'

module Doh

class Test_core_ext_empty < DohTest::TestGroup
  def test_blank
    assert_equal(true, nil.blank?)
  end
end

end

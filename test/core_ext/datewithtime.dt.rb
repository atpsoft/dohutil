require 'dohutil/core_ext/datewithtime'

module Doh

class Test_core_ext_datewithtime < DohTest::TestGroup
  def test_next_second
    assert_equal(DateTime.new(2009, 2, 10, 15, 30, 3), DateTime.new(2009, 2, 10, 15, 30, 2).next_second(1))
    assert_equal(Time.new(2009, 2, 10, 15, 30, 3), Time.new(2009, 2, 10, 15, 30, 2).next_second(1))
  end

  def test_datetime_diff
    assert_equal(61, DateTime.new(2013,4,5,8,1,1).sub_dt(DateTime.new(2013,4,5,8,0,0)))
  end
end

end

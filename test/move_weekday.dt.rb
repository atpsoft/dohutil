require 'dohutil/move_weekday'

module Doh

class TestMoveWeekday < DohTest::TestGroup
  def test_move_weekday
    assert_equal(Date.new(2011, 11, 11).to_s, Date.new(2011, 11, 10).next_weekday.to_s)
    assert_equal(Date.new(2011, 11, 14).to_s, Date.new(2011, 11, 11).next_weekday.to_s)
    assert_equal(Date.new(2011, 11, 11).to_s, Date.new(2011, 11, 14).previous_weekday.to_s)
    assert_equal(Date.new(2011, 11, 10).to_s, Date.new(2011, 11, 11).previous_weekday.to_s)
  end
end

end

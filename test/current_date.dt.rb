require 'dohutil/current_date'

module Doh

class TestCurrentDate < DohTest::TestGroup
  def test_date_as_and_time_as
    cdo = DateTime.new(2016,1,1,1,1,1)
    Doh.date_as(cdo) do
      assert_equal(cdo, Doh.current_datetime)
      Doh.time_as(10,5,3) do
        assert_equal(DateTime.new(2016,1,1,10,5,3), Doh.current_datetime)
      end
    end
  end
end

end

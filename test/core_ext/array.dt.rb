require 'dohutil/core_ext/array'

module Doh

class Test_core_ext_array < DohTest::TestGroup
  def test_include_any
    assert([1, 2, 3].include_any?([1,4,5]))
    assert(![1, 2, 3].include_any?([4,5,6]))
  end

  def test_include_all
    assert([1, 2, 3].include_all?([1,2]))
    assert(![1, 2, 3].include_all?([1,2,4]))
  end
end

end

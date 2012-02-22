require 'minitest/autorun'
require_relative '../lib/doh/core_ext/date'

module Doh

class Test_core_ext_date < MiniTest::Unit::TestCase
  def test_weekday
    Date.new(2007, 1, 15).upto(Date.new(2007, 1, 19)) { |date| assert(date.weekday?) }
    assert(!Date.new(2007, 1, 13).weekday?)
    assert(!Date.new(2007, 1, 14).weekday?)
  end
end

end

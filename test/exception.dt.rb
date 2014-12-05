require 'dohutil/exception'

module Doh

class Test_core_ext_exception < DohTest::TestGroup
  def test_matches
    begin
      raise 'some string it should match'
    rescue errors_matching {|excpt| excpt.to_s =~ /string it should/}
    end
    begin
      raise 'some str it shouldnt match'
    rescue errors_matching {|excpt| excpt.to_s =~ /string it should/}
      assert(false)
    rescue StandardError => _excpt
      assert(true)
    end
  end
end

end

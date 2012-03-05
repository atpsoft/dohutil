require 'doh/core_ext/string'

module Doh

class Test_core_ext_string < DohTest::TestGroup
  def test_mid
    str = 'smoe:blah'
    assert_equal('smoe:blah', str.mid(0))
    assert_equal('moe:blah', str.mid(1))
    assert_equal('ah', str.mid(7))
    assert_equal('h', str.mid(8))
    assert_equal('', str.mid(9))
    assert_equal(nil, str.mid(10))
    assert_equal(nil, str.mid(11))
    assert_equal('h', str.mid(-1))
    assert_equal('ah', str.mid(-2))
    assert_equal('moe:blah', str.mid(-8))
    assert_equal('smoe:blah', str.mid(-9))
    assert_equal(nil, str.mid(-10))

    assert_equal('', str.mid(0, 0))
    assert_equal('s', str.mid(0, 1))
    assert_equal('smoe', str.mid(0, 4))
    assert_equal('', str.mid(1, 0))
    assert_equal('ah', str.mid(7, 4))
    assert_equal('', str.mid(9, 0))
    assert_equal('', str.mid(9, 10))
    assert_equal('h', str.mid(-1, 10))

    assert_equal(nil, str.mid(0, -1))
    assert_equal(nil, str.mid(-1, -1))
  end

  def test_after
    str = 'smoe:blah:blee'
    assert_equal(nil, str.after('notinthereatall'))
    assert_equal('blah:blee', str.after(':'))
    assert_equal('', str.after(':blee'))
    assert_equal('blee', str.after('blah:'))
  end

  def test_rafter
    str = 'smoe:blah:blee'
    assert_equal(nil, str.rafter('notinthereatall'))
    assert_equal('blee', str.rafter(':'))
    assert_equal('', str.after(':blee'))
    assert_equal('blee', str.after('blah:'))
  end

  def test_before
    str = 'smoe:blah:blee'
    assert_equal(nil, str.before('notinthereatall'))
    assert_equal('smoe', str.before(':'))
    assert_equal('', str.before('smoe:'))
    assert_equal('smoe:blah', str.before(':blee'))
  end

  def test_rbefore
    str = 'smoe:blah:blee'
    assert_equal(nil, str.rbefore('notinthereatall'))
    assert_equal('smoe:blah', str.rbefore(':'))
    assert_equal('', str.rbefore('smoe:'))
    assert_equal('smoe:blah', str.rbefore(':blee'))
  end

  def test_firstn
    str = 'blah'
    assert_equal(nil, str.firstn(-1))
    assert_equal('', str.firstn(0))
    assert_equal('b', str.firstn(1))
    assert_equal('bl', str.firstn(2))
    assert_equal('blah', str.firstn(100))
  end

  def test_lastn
    str = 'blah'
    assert_equal(nil, str.lastn(-1))
    assert_equal('', str.lastn(0))
    assert_equal('h', str.lastn(1))
    assert_equal('ah', str.lastn(2))
    assert_equal('blah', str.lastn(100))
  end
end

end

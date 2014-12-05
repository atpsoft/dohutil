require 'dohutil/core_ext/force_deep_copy'

module Doh

class Parent
  force_deep_copy :var1, :var2
  attr_accessor :var1, :var2

  def initialize
    @var1 = @var2 = nil
  end
end

class Child < Parent
  force_deep_copy :var3
  attr_accessor :var3

  def initialize
    @var3 = nil
  end
end

class ShallowParent
  attr_accessor :var1, :var2

  def initialize
    @var1 = @var2 = nil
  end
end

class Test_core_ext_force_deep_copy < DohTest::TestGroup
  def test_regular_dup
    parent = ShallowParent.new
    parent.var1 = ['elem1']
    parent.var2 = {'key1' => 'val1'}
    parent2 = parent.dup
    assert(parent2.var1.equal?(parent.var1))
    assert(parent2.var2.equal?(parent.var2))
  end

  def test_force_deep_copy
    parent = Parent.new
    parent.var1 = ['elem1']
    parent.var2 = {'key1' => 'val1'}
    parent2 = parent.dup
    assert(!parent2.var1.equal?(parent.var1))
    assert(!parent2.var2.equal?(parent.var2))

    parent2.var1.push('elem2')
    parent2.var2['key2'] = 'val2'
    assert_equal(['elem1'], parent.var1)
    assert_equal(['key1'], parent.var2.keys)
    assert_equal(['val1'], parent.var2.values)
  end

  def test_force_deep_copy_inheritance
    child = Child.new
    child.var1 = ['elem1']
    child.var2 = {'key1' => 'val1'}
    child.var3 = Parent.new
    child.var3.var1 = ['blah']
    child.var3.var2 = nil
    child2 = child.dup
    assert(!child2.var1.equal?(child.var1))
    assert(!child2.var2.equal?(child.var2))
    assert(!child2.var3.equal?(child.var3))

    child2.var1.push('elem2')
    child2.var2['key2'] = 'val2'
    child2.var3.var1.push(['smoe'])
    child2.var3.var2 = 'val3'
    assert_equal(['elem1'], child.var1)
    assert_equal(['key1'], child.var2.keys)
    assert_equal(['val1'], child.var2.values)
    assert_equal(['blah'], child.var3.var1)
    assert_equal(nil, child.var3.var2)
  end
end

end

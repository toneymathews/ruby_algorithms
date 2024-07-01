require 'test_helper'
require 'ruby_algorithms/linked_list'

class LinkedListTest < Test::Unit::TestCase
  def setup
    @list = ::List.new
  end

  def test_list_append_with_one_value
    assert_nil @list.instance_variable_get(:@head)

    @list.append(10)
    assert_not_nil @list.find(10)
    assert_equal 10, @list.find(10).value
  end

  def test_list_append_with_multiple_values
    list = ::List.new
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)

    assert_equal 5, list.find(5).value
    assert_equal 5, list.find_tail.value
  end

  def test_append_after
    list = ::List.new
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)

    list.append_after(3, 6)
    node_three = list.find(3)
    assert_equal 6, node_three.tail.value
    assert_equal 4, node_three.tail.tail.value
  end

  def test_delete
    list = ::List.new
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)

    list.delete(2)
    assert_nil list.find(2)
  end

  def test_find_before
    list = ::List.new
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)

    assert_equal 4, list.find_before(5).value
  end
end
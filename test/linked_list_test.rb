require 'test_helper'
require 'ruby_algorithms/linked_list'

class LinkedListTest < Test::Unit::TestCase
  def setup
    @list = ::List.new
  end

  def test_list_append
    assert_nil @list.instance_variable_get(:@head)
  end
end
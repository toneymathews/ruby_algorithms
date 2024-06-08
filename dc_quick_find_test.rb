require './dc_quick_find.rb'

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
end


class DCQuickFindTest 
  def initialize
    @dc = DC.new(10)
  end

  def test_union_two_different_elements
    @dc.union(2,3)

    assert_equal 3, @dc.array[3]
    assert_equal 3, @dc.array[2]
  end

  def test_union_two_same_elements_makes_no_change
    @dc = DC.new(10)
    dupe = @dc.array

    @dc.union(2,2)

    assert_equal 2, @dc.array[2]
  end

  def test_union_two_different_elements_with_other_connected_elements
    @dc = DC.new(10)
    @dc.union(2,3)
    @dc.union(3,4)

    assert_equal 4, @dc.array[2]
    assert_equal 4, @dc.array[3]
    assert_equal 4, @dc.array[4]

  end

  private

  def assert_equal(expected, actual)
    if expected != actual 
      raise "Test failed. Expected: #{expected}, Actual: #{actual}"
    end
  end
end


dc = DCQuickFindTest.new
dc.test_union_two_different_elements
dc.test_union_two_same_elements_makes_no_change
dc.test_union_two_different_elements_with_other_connected_elements
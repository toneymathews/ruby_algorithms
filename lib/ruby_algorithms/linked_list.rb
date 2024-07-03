# a series of nodes holding a value and reference to the previous node.
# eg PR: https://github.com/rubygems/rubygems/pull/1188
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
end

class Node
  attr_accessor :tail
  attr_reader :value
  def initialize(value = nil)
    @value = value
    @tail = nil
  end

  def to_s
    "Node with value: #{@value}"
  end
end

class List
  def initialize
    @head = nil
  end

  def append(value)
    unless @head
      @head = Node.new(value)
    else
      find_tail.tail = Node.new(value)
    end
  end

  def append_after(target, value)
    node = find(target)

    return unless node

    old_node = node.tail
    node.tail = Node.new(value)
    node.tail.tail = old_node
  end

  def find(value)
    node = @head
    return false unless node
    return node if node.value == value

    while (node = node.tail)
      return node if node.value == value
    end
  end

  def find_tail
    node = @head
    return node unless node.tail
    while (node = node.tail)
      return node unless node.tail
    end
  end

  def delete(value)
    if @head.value == value
      @head = @head.tail if @head.tail
      return
    end

    node = find_before(value)
    node.tail = node.tail.tail
  end

  def find_before(value)
    node = @head
    return nil if !node.tail
    return node if node.tail.value == value

    while node = node.tail
      return node if node.tail && node.tail.value == value
    end
  end

  def remove_duplicates
    # brute forceadd to array. if element already exists, delete it.
    # time complexity is O(n) for the list * O(n) for traversing the array.
    # If we can sort the array, then the time complexity for finding an element will be removed
    # time complexity for deleting an element in the list is constant time

    node = @head
    array = []
    return unless node
    while node
      if array.include?(node.value)
        delete(node.value)
      else
        array.push(node.value)
      end
      node = node.tail
    end
  end

  def size
    return unless @head
    count = 1
    node = @head

    while node = node.tail
      count +=1
    end
    count
  end

  # time complexity is O(n squared)
  def remove_duplicates_without_buffer
    node = @head
    return unless node
    while node
      pointer = node.tail
      while pointer
        if node.value == pointer.value
          node.tail = pointer.tail
        end
        pointer = pointer.tail
      end
      node = node.tail
    end
  end
end

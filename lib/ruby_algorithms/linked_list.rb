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
      @head = @head.next if @head.next
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
end
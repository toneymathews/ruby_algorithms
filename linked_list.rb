# a series of nodes holding a value and reference to the previous node.
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
end

class Node
  attr_accessor :nxt, :value
  def initialize(nxt, value)
    @nxt = nxt
    @value = value
  end
end

class LinkedList
  attr_accessor :node
  def initialize(node)
    @node = node
  end
end

n = Node.new(nil, 24)
node = Node.new(n, 23)
list = LinkedList.new(node)
n.nxt = Node.new(nil, 25)

def print_all(node)
  p node.value
  print_all(node.nxt) if node.nxt
end

print_all(list.node)

# The below code gave an endless loop, not sure why. something about the while loop is off.
# @list = Node.new(nil, nil)
# @list.nxt = Node.new(nil, 23)

# def print_node(node)
#   p node.value
#   nxt = node.nxt
#   while nxt != nil
#     print_node(nxt)
#   end
# end

# count = 1
# p "i;m here"

# if count == 1 
#   print_node(@list)
#   count += 1
# end

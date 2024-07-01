require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
end


# Rules
# A union of p and q would have p's id change to that of q
# All connections of p would also have to change to that of q
# If p and q are same, there is nothing to do

# node is same as index
# value in the node indicates other nodes with the same value are connected

# Problems
# Time complexity is quadratic. How?. 
# Space complexity is O(n)

class DC
  attr_reader :size, :array
  def initialize(size)
    @size = size
    @array = Array.new(size) {|index| index}
  end

  def union(x, y)
    return if x == y

    connections_of(x).each { |index| @array[index] = @array[y] }

    # puts @array
  end

  def connected?(x, y)
    @array[x] == @array[y]
  end

  private

  # Returns an array of other nodes that are connected to the node at the first index
  def connections_of(node)
    connections = @array.each_index.select { |index| @array[index] == @array[node] }
    # puts "Connections of #{node} are #{connections}"

    connections
  end
end

# dc = DC.new(10)
# puts dc.array

# dc.union(2,3)
# dc.union(4,5)
# dc.union(6,7)
# dc.union(7,5)


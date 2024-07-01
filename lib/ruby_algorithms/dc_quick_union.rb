require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
end

# find: Check if p and q have the same root
# union: Set the id of p's root to the id of q's root

class DCQuickUnion
  attr_reader :size, :array
  def initialize(size)
    @size = size
    @array = Array.new(size) { |index| index }
  end

  def find(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    @array[root(p)] = @array[root(q)]
  end

  private

  def root(p)
    if @array[p] == p
      p
    else
      root(@array[p])
    end
  end


end

dc = DCQuickUnion.new(10)

dc.union(1,2)
dc.union(2,3)
dc.union(4,5)
dc.union(6,7)
dc.union(7,5)
debugger


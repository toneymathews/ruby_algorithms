require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
end

# Running time is almost linear (it's N + (M * lg*N))

class PathCompression
  attr_reader :size, :array, :weights
  def initialize(size)
    @size = size
    @array = Array.new(size) { |index| index }
    @weights = Array.new(size, 1)
  end

  def find(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    i = root(p)
    j = root(q)
    if @weights[j] < @weights[i]
      @array[j] = @array[i]
      @weights[i] += @weights[j]
    else
      @array[i] = @array[j]
      @weights[j] += @weights[i]
    end 
  end

  private

  def root(p)
    if @array[p] == p
      p
    else
      # Set the root to the grandfather root.
      @array[p] = @array[@array[p]]

      root(@array[p])
    end
  end
end

dc = PathCompression.new(10)

dc.union(1,2)
dc.union(2,3)
dc.union(4,5)
dc.union(6,7)
dc.union(7,5)
debugger
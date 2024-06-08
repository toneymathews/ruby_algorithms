require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
  # gem 'sorbet'
end

class SocialNetworkConnectivity
  attr_reader :size, :timestamps, :array, :weights, :connected_array

  def initialize(size, timestamps)
    debugger;
    @size = size
    # @timestamps = T.let(timestamps, T::Hash[String, T::Array[Integer, Integer]])
    @timestamps = timestamps

    @array = Array.new(size) { |index| index }
    @weights = Array.new(size, 1)
    @connected_array = []
  end

  def process_array
    @timestamps.each do |entry|
      t = entry[0]
      elements = entry[1]
      union(*elements)

      return t if all_connected?
    end
  end

  private

  def all_connected?
    @connected_array.size == @array.size
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

    merge_to_connected_entries(p, q)
  end

  def merge_to_connected_entries(p, q)
    @connected_array.push(p) if !@connected_array.include?(p)
    @connected_array.push(q) if !@connected_array.include?(q)
  end

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

timestamps = {
  1 => [0,1], 
  2 => [1,2], 
  3 => [3,4], 
}
debugger;

snc = SocialNetworkConnectivity.new(5, timestamps)
debugger;
# running time: m * log n
# use extra space proportional to n
# n is same as size
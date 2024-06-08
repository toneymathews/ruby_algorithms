require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'debug'
end


n = 10
array = [[1,2], [3,4], [5,6], [7,8], [8,9], [2,8], [0,5]]
connected_array = []

array.each do |new_element|
  if connected_array.empty?
    ele = []
    ele << new_element[0]
    ele << new_element[1] if new_element[0] != new_element[1]
    connected_array << ele
    debugger
  else
    connected_array.each do |existing_element|
      if existing_element.include?(new_element[0])
        existing_element << new_element[1]
        break
      elsif existing_element.include?(new_element[1])
        existing_element << new_element[0]
        break
      end
    end
  end
end

# make a duplicate copy of the array and see if that works. Now I'm updating the array as I iterate through it.

puts connected_array
# make a connected component array
# 
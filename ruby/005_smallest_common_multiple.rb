# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
require 'prime'

# Returns the smallest common multiple of all elements in a given array
def smallest_common_multiple(values)
  max = values.reduce(:*)
  min_step = values.select { |v| v.prime? }.reduce(:*)
  min = min_step

  (min..max).step(min).find { |n|
    values.select { |v| n % v != 0 }.empty?
  }
end

# Test Case
vals = (6..10).to_a
p [smallest_common_multiple(vals), smallest_common_multiple(vals) == 2520]

puts smallest_common_multiple (11..20).to_a # => 232792560

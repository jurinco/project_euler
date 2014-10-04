require 'prime'

# Return the smallest positive number that is evenly divisible by all elements in a given array
def smallest_multiple(values)
  max = values.reduce(:*)
  min_step = values.select { |v| v.prime? }.reduce(:*)
  min = min_step

  (min..max).step(min).find { |n|
    values.select { |v| n % v != 0 }.empty?
  }
end

# Test Case
vals = (6..10).to_a
p [smallest_multiple(vals), smallest_multiple(vals) == 2520]

vals = (11..20).to_a
puts smallest_multiple(vals)

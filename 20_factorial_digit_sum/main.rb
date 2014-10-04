require_relative '../common/euler'
include Euler

def sum_digits(n)
  n.to_s.split('').reduce(0) { |sum, d| sum + d.to_i }
end

# Test Case
n = factorial(10)
p [sum_digits(n), sum_digits(n) == 27]

p sum_digits(factorial(100)) # => 648

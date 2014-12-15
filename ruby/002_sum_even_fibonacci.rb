# Sum the even-valued terms of the Fibonacci sequence which have a value <= four million.
require_relative 'euler'
include Euler

def sum_even_fibonacci(lim)
  fibonacci_nums.take_while { |n| n < lim }.select { |n| n.even? }.reduce(:+)
end

# Test cases
p [sum_even_fibonacci(10), sum_even_fibonacci(10) == 10]
p [sum_even_fibonacci(20), sum_even_fibonacci(20) == 10]
p [sum_even_fibonacci(100), sum_even_fibonacci(100) == 44]

p sum_even_fibonacci(4_000_000) # => 4613732

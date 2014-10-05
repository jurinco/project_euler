require_relative '../common/euler'
include Euler

# Find the first Fibonacci number to have n digits
# Return the Fibonacci number and it's index (e.g. [55, 10])
def first_fib_of_length(n)
  fibonacci_nums.with_index(1).find { |fib|
    fib[0].to_s.length == n
  }
end

p [first_fib_of_length(1), first_fib_of_length(1) == [1,1]]
p [first_fib_of_length(2), first_fib_of_length(2) == [13,7]]
p [first_fib_of_length(3), first_fib_of_length(3) == [144,12]]

p first_fib_of_length(1_000)[1] # => 4782

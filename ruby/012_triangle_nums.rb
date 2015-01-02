# What is the value of the first triangle number to have over five hundred divisors?

require_relative '../common/euler'
include Euler

@triangular_nums = Enumerator.new do |y|
  index = 0
  sum = 0
  loop do
    index += 1
    sum += index
    y.yield sum
  end
end

def first_triangle_num_with_more_than_n_divisors(n)
  @triangular_nums.find { |t|
    t.factors.length > n
  }
end

# Test Case
p [first_triangle_num_with_more_than_n_divisors(5), first_triangle_num_with_more_than_n_divisors(5) == 28]

p first_triangle_num_with_more_than_n_divisors(500) # => 76576500

require_relative '../common/euler'
include Euler

# Returns numbers that equal the sum of the factorials of their digits
def nums_that_eql_their_factorial_sum(upper_lim)
  factorials = (0..9).map { |d| d.factorial }

  (10..upper_lim).find_all do |n|
    fact_sum = n.to_s.each_char.reduce(0) { |sum, d| sum + factorials[d.to_i] }
    n == fact_sum
  end
end


# Find upper limit
n = 1
while 9.factorial * n > 10**n-1
  n += 1
end
upper_lim = 9.factorial * n # => 2540160


nums = nums_that_eql_their_factorial_sum(upper_lim)

# Test Case
p [145, nums.include?(145) == true]

p nums.reduce(:+) # => 40730

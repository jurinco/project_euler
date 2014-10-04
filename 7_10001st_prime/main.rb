require 'prime'

# Return the nth prime with n >= 1
def nth_prime(n)
  Prime.take(n).last
end

# Test Case
p [nth_prime(6), nth_prime(6) == 13]

p nth_prime(10_001) # => 104743

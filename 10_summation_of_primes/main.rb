require 'prime'

def summation_of_primes(limit)
  Prime.take_while { |p| p < limit }.reduce(:+)
end

# Test Case
p [summation_of_primes(10), summation_of_primes(10) == 17]

p summation_of_primes(2_000_000) # 142913828922

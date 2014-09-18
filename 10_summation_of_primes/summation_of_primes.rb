require 'prime'

def summation_of_primes(limit)
  Prime.take_while { |p| p < limit }.reduce(:+)
end

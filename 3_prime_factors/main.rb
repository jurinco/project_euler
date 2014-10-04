require 'prime'

def largest_prime_factor(n)
  return nil if n.prime?
  n.prime_division.map { |arr| arr[0] }.max
end

# Test Cases
p [largest_prime_factor(13_195), largest_prime_factor(13_195) == 29]

p largest_prime_factor(600_851_475_143) # 6857

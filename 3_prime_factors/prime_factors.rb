require 'prime'

def prime_factors(n)
  factors = []
  Prime.each do |prime|
    if n % prime == 0
      factors << prime
    end
    return factors if prime ** 2 >= n
  end
end

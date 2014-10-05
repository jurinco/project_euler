require 'prime'

# Insigts
# b must be prime
# 1-b < a < 0
def quadradic_primes(limit)
  max = Array.new(3,0)  # [a, b, n]

  Prime.take_while do |b|
    (1-b..-1).each do |a|
      n = 0
      while (n**2 + n*a + b).prime?
        n += 1
      end
      max = [a, b, n] if n > max[2]
    end
    b < limit
  end
  max
end

# Test Cases
# n² - n + 41
a, b, n = quadradic_primes(41)
p [a, a == -1]
p [b, b == 41]
p [n, n == 41]

# n² − 79n + 1601
a, b, n = quadradic_primes(1601)
p [a, a == -79]
p [b, b == 1601]
p [n, n == 80]

a, b, n = quadradic_primes(999)
puts "n^2 + #{a}n + #{b}"
p a * b # => -59231

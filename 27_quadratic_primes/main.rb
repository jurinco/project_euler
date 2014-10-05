require  'benchmark'
require 'prime'

def quadradic_primes(limit)
  primes = {}
  Prime.take_while { |p|
    if p <= limit**2
      primes[p] = true
    end
  }

  max = Array.new(3,0)  # [a, b, n]
  (-limit..limit).each do |a|
    (-limit..limit).each do |b|
      n = 0
      while primes[(n**2 + n*a + b).abs]
        n += 1
      end
      max = [a, b, n] if n > max[2]
    end
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
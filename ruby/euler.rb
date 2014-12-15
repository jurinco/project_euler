require 'prime'

class Integer
  def abundant?
    (self.proper_divisors.reduce(:+) || 0) > self
  end

  def digital_sum
    self.to_s.chars.reduce(0) { |sum,n| sum + n.to_i }
  end

  def factorial
    return 1 if self == 0
    (1..self).reduce(:*)
  end

  def factors
    f_list = []
    step = self.even? ? 1 : 2
    upper_bound = Math.sqrt(self).to_i
    (1..upper_bound).step(step).each { |i|
      if self % i == 0
        f_list << i
        f_list << self / i unless i * i == self
      end
    }
    f_list.sort
  end

  def prime?
    return self >= 2 if self <= 3
    return false if self % 2 == 0 or self % 3 == 0
    (5..(self**0.5).floor).step(6).each do |i|
      if self % i == 0 || self % (i + 2) == 0
        return false
      end
    end
    true
  end

  def proper_divisors
    self.factors[0..-2]
  end


  def polygonal?(s)
    n = (Math.sqrt(8*(s-2)*self + (s-4)**2) + (s-4)) / (2*(s-2))
    n % 1 == 0
  end

  def triangular?
    polygonal?(3)
  end

  def square?
    Math.sqrt(self) % 1 == 0
  end

  def pentagonal?
    polygonal?(5)
  end

  def hexagonal?
    polygonal?(6)
  end

  def heptagonal?
    polygonal?(7)
  end

  def octagonal?
    polygonal?(8)
  end
end


module Euler
  # binomial theorem, n choose k
  def binomial(n,k)
    return 0 if n-k < 0
    return 1 if n == k || k <= 0
    n.factorial / ( k.factorial * (n-k).factorial )
  end

  def fibonacci_nums
    Enumerator.new do |y|
      fib1, fib2 = 1, 1
      loop do
        y.yield fib1
        new_fib = fib1 + fib2
        fib1 = fib2
        fib2 = new_fib
      end
    end
  end

  def number_with_underscore_delimiter(n)
    arr = n.to_s.split('')
    new_num = arr.pop(3)
    until arr.empty?
      new_num.unshift('_')
      new_num.unshift(arr.pop(3))
    end
    new_num.flatten.join
  end

  def polygonal(s,n)
    raise ArgumentError, 'n must be >= 0' if n < 0
    (s-2) * (n * (n-1) / 2) + n
  end

  def triangular_num(i)
    polygonal(3,i)
  end

  def pentagonal_num(i)
    polygonal(5,i)
  end

  def hexagonal_num(i)
    polygonal(6,i)
  end
end

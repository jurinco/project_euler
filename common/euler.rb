class Integer
  def abundant?
    (self.proper_divisors.reduce(:+) || 0) > self
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

  def hexagonal?
    n = (Math.sqrt(8*self+1) + 1) / 4
    n % 1 == 0
  end

  def pentagonal?
    n = (Math.sqrt(24*self+1) + 1) / 6
    n % 1 == 0
  end

  def proper_divisors
    self.factors[0..-2]
  end

  def triangular?
    Math.sqrt(8*self+1) % 1 == 0
  end
end


module Euler
  # binomial theorem, n choose k
  def binomial(n,k)
    return 0 if n-k < 0
    return 1 if n == k || k <= 0
    n.factorial / ( k.factorial * (n-k).factorial )
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

  # Return ith Triangular number. (index starts at 0)
  def triangular_num(i)
    raise ArgumentError, 'n must be >= 0' if i < 0
    i * (i+1) / 2
  end

  # Return ith Pentagonal number. (index starts at 0)
  def pentagonal_num(i)
    raise ArgumentError, 'n must be >= 0' if i < 0
    i * (3*i-1) / 2
  end

  # Return ith Hexagonal number. (index starts at 0)
  def hexagonal_num(i)
    raise ArgumentError, 'n must be >= 0' if i < 0
    i * (2*i-1)
  end
end

class Integer
  def abundant_number?
    self.proper_divisors.reduce(:+) > self
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

  def proper_divisors
    self.factors[0..-2]
  end
end


module Euler
  # binomial theorem, n choose k
  def binomial(n,k)
    return 1 if n-k <= 0
    return 1 if k <= 0
    n.factorial / ( k.factorial * (n-k).factorial )
  end

  def factors(n)
    f_list = []
    step = n.even? ? 1 : 2
    upper_bound = Math.sqrt(n).to_i
    (1..upper_bound).step(step).each { |i|
      if n % i == 0
        f_list << i
        f_list << n / i unless i * i == n
      end
    }
    f_list.sort
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

  def perfect_number?(n)
    n.proper_divisors.reduce(:+) == n
  end

  def triangular_num(n)
    n * (n+1) / 2
  end

  def triangular_num?(x)
    Math.sqrt(8*x + 1) % 1 == 0
  end

  def pentagonal_num(n)
    n * (3*n-1) / 2
  end

  def pentagonal_num?(x)
    n = (Math.sqrt(24*x+1) + 1) / 6
    n % 1 == 0
  end

  def hexagonal_num(n)
    n * (2*n-1)
  end

  def hexagonal_num?(x)
    n = (Math.sqrt(8*x+1) + 1) / 4
    n % 1 == 0
  end
end

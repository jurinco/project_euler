module Euler

  def abundant_number?(n)
    proper_divisors(n).reduce(:+) > n
  end

  # binomial theorem, n choose k
  def binomial(n,k)
    return 1 if n-k <= 0
    return 1 if k <= 0
    factorial(n) / ( factorial(k) * factorial( n - k ) )
  end

  def factorial(n)
    return 1 if n == 0
    (1..n).reduce(:*)
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
    proper_divisors(n).reduce(:+) == n
  end

  def proper_divisors(n)
    factors(n)[0..-2]
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

module Euler

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

  def proper_divisors(n)
    factors(n)[0..-2]
  end

end

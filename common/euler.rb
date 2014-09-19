module Euler

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

end

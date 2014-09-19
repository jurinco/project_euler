def factors(num)
  f_list = []
  step = num.even? ? 1 : 2
  upper_bound = Math.sqrt(num).ceil
  (1..upper_bound).step(step).each { |i|
    if num % i == 0
      f_list << i
      f_list << num / i
    end
  }
  f_list.uniq.sort
end

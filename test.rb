

def factors(n)
  f_list = []
  step = n.even? ? 1 : 2
  upper_bound = Math.sqrt(n).ceil
  (1..upper_bound).step(step).each { |i|
    if n % i == 0
      f_list << i
      f_list << n / i
    end
  }
  f_list.uniq.sort
end


beginning_time = Time.now
puts factors(76576500).length
puts "Time elapsed #{(Time.now - beginning_time)} seconds"

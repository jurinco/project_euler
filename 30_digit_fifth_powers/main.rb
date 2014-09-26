pow = 5

i = 0
vals = []
loop do
  min = 10**i
  max = 10**(i+1) - 1
  max_sum = 9**pow * (i+1)
  break if max_sum < min

  max = max < max_sum ? max : max_sum
  (min..max).each do |n|
    sum = n.to_s.split('').reduce(0) { |sum, n| sum + n.to_i ** pow }
    vals << n if sum == n
  end

  i += 1
end

puts "digits: #{vals.join(' ')}"
puts "sum: #{vals.reduce(:+)}"

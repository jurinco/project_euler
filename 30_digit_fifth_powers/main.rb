def digit_power_sums(power)
  vals = []
  len = 2
  loop do
    min = ('1' * len).to_i
    max = 10**len - 1
    max_sum = 9**power * len
    break if max_sum < min

    max = max < max_sum ? max : max_sum
    (min..max).each do |n|
      sum = n.to_s.split('').reduce(0) { |sum, n| sum + n.to_i ** power }
      vals << n if sum == n
    end
    len += 1
  end
  vals
end

# Test Case
p [digit_power_sums(4), digit_power_sums(4) == [1634, 8208, 9474]]

p digit_power_sums(5).reduce(:+) # => 443839

def sum_of_digits_of_two_to_the_n_power(n)
  (2**n).to_s.split('').reduce(0) { |sum, d| sum + d.to_i }
end

# Test Case
p [sum_of_digits_of_two_to_the_n_power(15), sum_of_digits_of_two_to_the_n_power(15) == 26]

puts sum_of_digits_of_two_to_the_n_power(1000) # => 1366

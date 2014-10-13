# Insights
# max_n = 10, because there are n+1 digits in 10**n

class Integer
  def length
    Math.log10(self).floor + 1
  end
end

vals = []
(1..9).each do |n|
  pow = 1
  while (n**pow).length == pow
    vals << [n**pow, n, pow]
    pow += 1
  end
end

# Test Cases
p [[16807, 7, 5], vals.include?([16807, 7, 5]) == true]
p [[134217728, 8, 9], vals.include?([134217728, 8, 9]) == true]

p vals.count # => 49

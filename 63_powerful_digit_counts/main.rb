class Integer
  def num_of_digits
    Math.log10(self).floor + 1
  end
end

vals = []
(1..50).each do |n|
  (1..50).each do |p|
    num = n**p
    d = num.num_of_digits
    vals << [num, n, p] if d == p
  end
end

# Test Cases
p [[16807, 7, 5], vals.include?([16807, 7, 5]) == true]
p [[134217728, 8, 9], vals.include?([134217728, 8, 9]) == true]

p vals
p vals.count # => 49

# (1..9), (1..9) => 36
# (1..15), (1..15) => 43
# (1..20), (1..20) => 48
# (1..30), (1..30) => 49
# (1..50), (1..50) => 49

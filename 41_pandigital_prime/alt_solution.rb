require 'prime'

max_n = 9.downto(4).find { |n|
  (1..n).reduce(:+) % 3 != 0
}

max = 0
digits = []
('1'..max_n.to_s).each do |n|
  digits << n
  digits.permutation.each do |p|
    p = p.join.to_i
    max = p if p.prime?
  end
end

p max # => 7652413

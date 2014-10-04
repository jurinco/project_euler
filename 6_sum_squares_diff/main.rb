# Square every values in an array, then sum the results
def sum_of_squares(vals)
  vals.map { |v| v ** 2 }.reduce(:+)
end

# Sum the values in an array, then square the result
def square_of_sum(vals)
  vals.reduce(:+) ** 2
end

def sum_square_diff(vals)
  square_of_sum(vals) - sum_of_squares(vals)
end

# Test Cases
vals = (1..10).to_a
p [sum_of_squares(vals), sum_of_squares(vals) == 385]
p [square_of_sum(vals), square_of_sum(vals) == 3025]
p [sum_square_diff(vals), sum_square_diff(vals) == 2640]


vals = (1..100).to_a
puts sum_square_diff(vals) # 25164150

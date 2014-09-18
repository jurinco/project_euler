def sum_of_squares(vals)
  vals.map { |v| v ** 2 }.reduce(:+)
end

def square_of_sum(vals)
  vals.reduce(:+) ** 2
end

def sum_square_diff(vals)
  square_of_sum(vals) - sum_of_squares(vals)
end

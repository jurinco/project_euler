def sum_spiral_diagonals(dim)
  m = 2
  corner_count = 0
  sum = 0
  (1..dim**2).each do |n|
    if (n - 1) % m == 0
      sum += n
      corner_count += 1
      if corner_count == 4
        m += 2
        corner_count = 0
      end
    end
  end
  sum
end

# Test Cases
p [sum_spiral_diagonals(1), sum_spiral_diagonals(1) == 1]
p [sum_spiral_diagonals(3), sum_spiral_diagonals(3) == 25]
p [sum_spiral_diagonals(5), sum_spiral_diagonals(5) == 101]

p sum_spiral_diagonals(1001) # => 669171001

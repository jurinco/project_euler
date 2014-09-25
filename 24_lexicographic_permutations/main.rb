a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
puts a.permutation.to_a[999_999].map { |d| d.to_s }.join

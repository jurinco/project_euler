(2**1000).to_s.split('').reduce(0) { |sum, d| sum + d.to_i } # => 1366

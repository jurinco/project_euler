# Insights
# Pell's equation
# http://en.wikipedia.org/wiki/Pell%27s_equation#Concise_representation_and_faster_algorithms

require 'benchmark'

def solve(d)
  return nil if (d**0.5) % 1 == 0
  # min_x = ((d+1)**0.5).ceil
  (1..1_000_000).each do |x|
    y2 = (x**2 - 1) / d.to_f
    # p y2
    if y2 >= 1
      y = y2**0.5
      return [d,x,y.to_i] if y % 1 == 0
    end
  end
  nil
end

def d_with_max_x(d_limit)
  vals = []
  (2..d_limit).each do |d|
    r = solve(d)
    vals << r if r
  end
  vals.max_by { |v| v[1] }[0]
end

# Test Case
p [d_with_max_x(7), d_with_max_x(7) == 5]

puts Benchmark.measure {
# 10_000
# p d_with_max_x(1000) # => 29
# vals.select { |v| v[0] == 29 } # => 9801

# 100_000
# puts "count: #{vals.count}" # => 543
# p d_with_max_x(1000) # => 339
# vals.select { |v| v[0] == 339 } # => 97970

# # 500_000
# puts "count: #{vals.count}" # => 591
# p d_with_max_x(1000) # => 459
# vals.select { |v| v[0] == 459 } # => 499850

# # 1_000_000
# puts "count: #{vals.count}" # => 591
# p d_with_max_x(1000) # => 459
# vals.select { |v| v[0] == 459 } # => 499850

# puts "count: #{vals.count}" # =>
p d_with_max_x(1000) # =>
# vals.select { |v| v[0] ==  } # =>



}

(1..1000).count { |n| n**0.5 % 1 != 0 } # => 969

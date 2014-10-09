require 'benchmark'
require 'prime'

def spiral
  prime_count = 0.0
  diagonal_count = 1

  finish = 1
  l = 1
  loop do
    start = finish + 1
    finish = start + 2**3 * l - 1
    offset = 2 * l - 1
    prime_count += (start+offset..finish).step(2*l).count { |d| d.prime? }
    diagonal_count += 4
    prime_ratio = prime_count / diagonal_count
    if prime_ratio < 0.1
      side_length = l*2 + 1
      return side_length
    end
    l += 1
  end
end

puts Benchmark.measure {
  p spiral # => 26241
}

# 42.760000   0.110000  42.870000 ( 44.063059)



# require 'prime'

# def spiral(side_length)
#   diagonals = [[1]]
#   num_of_layers = side_length/2 + 1
#   finish = 1
#   (1...num_of_layers).each do |l|  # layers
#     start = finish + 1
#     finish = start + 2**3 * l - 1
#     offset = 2 * l - 1
#     diagonals << (start+offset..finish).step(2*l).to_a
#   end

#   diagonals
# end

# # Test Cases
# p [spiral(1)[0], spiral(1)[0] == [1]]
# p [spiral(3)[1], spiral(3)[1] == [3,5,7,9]]
# p [spiral(5)[2], spiral(5)[2] == [13,17,21,25]]


# def prime_ratio(vals)
#   prime_count = vals.flatten.count { |n| n.prime? }
#   total = vals.flatten.count
#   prime_count / total.to_f
# end

# p [prime_ratio(spiral(3)), prime_ratio(spiral(3)) == 0.6]
# p [prime_ratio(spiral(5)), prime_ratio(spiral(5)) == 5/9.0]
# p [prime_ratio(spiral(7)), prime_ratio(spiral(7)) == 8/13.0]


# # p (2..20_000).step(2).find { |i| prime_ratio(spiral(i)) < 0.1 }

# (15_000..20_000).step(2).find do |i|
#   r = prime_ratio(spiral(i))
#   puts r
#   r < 0.1
# end

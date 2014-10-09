require 'benchmark'
require 'prime'

def spiral(ratio)
  diagonal_count = 1
  prime_count = 0.0
  gap = 2
  n = 1

  # Loop through successive layers of the spiral
  loop do
    count = 0
    4.times {
      n += gap
      prime_count += 1 if n.prime?
    }
    diagonal_count += 4
    gap += 2

    prime_ratio = prime_count / diagonal_count
    if prime_ratio < ratio
      side_length = diagonal_count / 2 + 1
      return side_length
    end
  end
end

# Test Case
p [spiral(0.61), spiral(0.61) == 3]
p [spiral(0.56), spiral(0.56) == 5]


puts Benchmark.measure {
  p spiral(0.1) # => 26241
}

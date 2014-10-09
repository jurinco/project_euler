require_relative '../common/euler'
include Euler

def spiral(ratio)
  d_count = 1     # diagonal count
  p_count = 0.0   # prime count
  gap = 2
  n = 1

  # Loop through successive layers of the spiral
  loop do
    count = 0
    4.times {
      n += gap
      p_count += 1 if n.prime?
    }
    d_count += 4
    gap += 2

    if p_count / d_count < ratio
      side_length = d_count / 2 + 1
      return side_length
    end
  end
end

# Test Case
p [spiral(0.61), spiral(0.61) == 3]
p [spiral(0.56), spiral(0.56) == 5]

p spiral(0.1) # => 26241

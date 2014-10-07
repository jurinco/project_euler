require 'prime'

def rotations(n)
  r = n.to_s.length - 1 # num of rotations

  r.times.map do
    n0 = n / 10**r
    n_remain = n % 10**r
    n = n_remain * 10 + n0
  end
end

vals = []
Prime.each do |n|
  break if n >= 1_000_000
  rotations = rotations(n)
  vals << n unless rotations.find { |r| !r.prime? }
end

# Test Case
p [197, vals.include?(197) == true]

p vals.length # => 55

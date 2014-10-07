require 'prime'

def right_to_left_prime?(n)
  count = n.to_s.length - 1
  count.times do
    n /= 10
    return false unless n.prime?
  end
  true
end

def left_to_right_prime?(n)
  l = n.to_s.length - 1
  l.downto(1).each do |i|
    n %= 10**i
    return false unless n.prime?
  end
  true
end

vals = []
Prime.each do |p|
  next if p < 10
  break if vals.length == 11
  if right_to_left_prime?(p) && left_to_right_prime?(p)
    vals << p
  end
end

# Test Case
p [3797, vals.include?(3797) == true]

puts vals.reduce(:+) # => 748317

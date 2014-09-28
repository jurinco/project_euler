require 'prime'

def right_to_left_prime?(n)
  len = n.to_s.length
  (len-1).times do
    n /= 10
    return false unless n.prime?
  end
  true
end

def left_to_right_prime?(n)
  m = n.to_s.length - 1
  m.downto(1).each do |i|
    n %= 10**i
    return false unless n.prime?
  end
  true
end

vals = []
m = 1
Prime.each do |p|
  next if p < 10
  break if vals.length == 11
  if right_to_left_prime?(p) && left_to_right_prime?(p)
    vals << p
  end
end

puts vals
puts "sum: #{vals.reduce(:+)}"

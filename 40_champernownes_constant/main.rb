d = (1..190_000).map(&:to_s).join

# Test Case
p [d[0..32], d[0..32] == '123456789101112131415161718192021']

product = 1
(0..6).each { |e|
  product *= d[10**e-1].to_i
}

p product # => 210

d = (1..190_000).map(&:to_s).join

product = 1
(0..6).each { |e|
  product *= d[10**e-1].to_i
}

puts "product: #{product}"

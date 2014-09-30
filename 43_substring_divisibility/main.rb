ds = [2,3,5,7,11,13,17]

vals = []
('0'..'9').to_a.permutation.each { |p|
  n = p.join
  prop = ds.each_with_index.all? { |d,i|
    n[i+1,3].to_i % d == 0
  }
  vals << n if prop
}

puts "values:", vals
sum = vals.reduce(0) { |sum,v| sum + v.to_i }
puts "sum: #{sum}"

ds = [2,3,5,7,11,13,17]

vals =
  ('0'..'9').to_a.permutation.select do |p|
    n = p.join
    ds.each_with_index.all? { |d,i|
      n[i+1,3].to_i % d == 0
    }
  end

vals.map! { |digits| digits.join.to_i }

# Test Case
p [1406357289, vals.include?(1406357289) == true]
p [9827536041, vals.include?(9827536041) == false]

p vals.reduce(:+) # => 16695334890

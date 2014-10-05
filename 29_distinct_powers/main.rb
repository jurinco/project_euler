def distinct_powers(min, max)
  powers = []
  (min..max).each do |a|
    (min..max).each do |b|
      powers << a**b
    end
  end
  powers.sort.uniq
end

# Test Case
p [distinct_powers(2,5), distinct_powers(2,5) == [4,8,9,16,25,27,32,64,81,125,243,256,625,1024,3125]]

p distinct_powers(2, 100).count # => 9183

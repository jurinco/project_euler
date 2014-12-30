# Find three natural numbers, a < b < c, for which
# a^2 + b^2 = c^2

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

pythagorean_triplets = Enumerator.new do |y|
  c = 3
  loop do
    c2 = c ** 2
    ((c/2).ceil..c-1).each do |b|
      b2 = b ** 2
      a2 = c2 - b2
      a = Math.sqrt(a2)
      if (a % 1 == 0) && (a < b)
        y.yield [a,b,c].map{ |n| n.to_i }
      end
    end
    c += 1
  end
end

# Test Case
p [pythagorean_triplets.first, pythagorean_triplets.first == [3,4,5]]

pythagorean_triplets.each do |triplet|
  if triplet.reduce(:+) == 1000
    puts triplet.join(' ')
    puts "    sum: #{triplet.reduce(:+)}"
    puts "product: #{triplet.reduce(:*)}" # => 31875000
    break
  end
end

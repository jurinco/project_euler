# Find three natural numbers, a < b < c, for which
# a^2 + b^2 = c^2
# c_max: max value for c
def pythagorean_triplets(c_max)
  triplets = []
  (3..c_max).each do |c|
    c2 = c ** 2
    ((c/2).ceil..c-1).each do |b|
      b2 = b ** 2
      a2 = c2 - b2
      a = Math.sqrt(a2)
      if (a % 1 == 0) && (a < b)
        triplets << [a,b,c].map{ |n| n.to_i }
      end
    end
  end
  triplets
end

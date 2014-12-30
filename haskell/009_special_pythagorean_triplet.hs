-- Find three natural numbers, a < b < c, for which
-- a^2 + b^2 = c^2

-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.

pythagoreanTriplets n =
  [[a,b,c] | c <- [(n-1),(n-2)..3],
             b <- [(c-1),(c-2)..2],
             let a = n - b - c,
             a > 0,
             a^2 + b^2 == c^2]

-- (head $ pythagoreanTriplets 12) == [3,4,5]

solve n = product . head . pythagoreanTriplets $ n

-- solve 12 == 60
-- solve 1000 == 31875000

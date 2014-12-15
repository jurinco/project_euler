-- What is the smallest positive number that is evenly divisible by all of
-- the numbers from 1 to 20?
import Euler

-- Return the smallest positive number that is evenly divisible by all numbers in range r
minCommonMultiple r =
  helper min_n r
  where
    -- min_n = filter (\ x -> null (tail (factors x))) r -- lower bound for solution
    min_n = product $ filter isPrime r
    helper n r
      | all (\ x -> mod n x == 0) r = n
      | otherwise                   = helper (n + min_n) r

test0 = minCommonMultiple [1..10] == 2520
solution = minCommonMultiple [1..20] -- 232792560

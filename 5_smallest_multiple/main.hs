-- What is the smallest positive number that is evenly divisible by all of the
-- numbers from 1 to 20?

-- Return an unsorted list of factors of number n
factors n =
  helper n 1
  where
    helper n x
      | x ^ 2 > n    = []
      | mod n x == 0 = x : (div n x) : helper n (x + 1)
      | otherwise    = helper n (x + 1)

-- Return True if a number is prime, else False
is_prime n = length (factors n) == 2


-- Return the smallest positive number that is evenly divisible by all numbers in range r
solve r =
  helper min_n r
  where
    -- min_n = filter (\ x -> null (tail (factors x))) r -- lower bound for solution
    min_n = product $ filter is_prime r
    helper n r
      | all (\ x -> mod n x == 0) r = n
      | otherwise                   = helper (n + min_n) r

-- solve [1..10] == 2520
-- solve [1..20] == 232792560

-- Find the sum of all the multiples of 3 or 5 below 1000.
f n = sum [x | x <- [1..(n-1)], mod x 3 == 0 || mod x 5 == 0]

-- f 10 == 23
-- f 1000 == 233168

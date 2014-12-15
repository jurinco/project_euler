-- Find the sum of all the multiples of 3 or 5 below 1000.
f n = sum [x | x <- [1..(n-1)], mod x 3 == 0 || mod x 5 == 0]

test0 = f 10 == 23
test1 = f 15 == 45
solution = f 1000 -- 233168

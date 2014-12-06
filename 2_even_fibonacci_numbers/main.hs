fibStream = fib 1 2
  where
    fib a b = a : fib b (a+b)
-- take 10 fibStream == [1,2,3,5,8,13,21,34,55,89]

sol = sum [x | x <- takeWhile (\ x -> x < 4000000) fibStream, mod x 2 == 0]
-- sol == 4613732

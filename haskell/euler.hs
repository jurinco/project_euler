module Euler
( factors
, fibs
, isPrime
, primeFactors
, primes
) where

-- Return an unsorted list of factors of number n
factors :: Integral t => t -> [t]
factors n =
  helper n 1
  where
    helper n x
      | x ^ 2 > n    = []
      | mod n x == 0 = x : (div n x) : helper n (x + 1)
      | otherwise    = helper n (x + 1)

fibs :: [Integer]
fibs = fib 1 2
  where
    fib a b = a : fib b (a+b)

intRoot :: Integer -> Integer
intRoot = floor . sqrt . fromInteger

-- Return True if a number is prime, else False
isPrime :: Integer -> Bool
isPrime n = primeFactors n == [n]

primeFactors :: Integer -> [Integer]
primeFactors n =
  case factor of
    [] -> [n]
    [x] -> x : primeFactors (div n x)
  where
    factor = take 1 . filter (\ x -> mod n x == 0) $ [2 .. intRoot n]

primes :: [Integer]
primes = filter isPrime [2..]

module Euler
( fibStream
, primeFactors
) where

fibStream :: [Integer]
fibStream = fib 1 2
  where
    fib a b = a : fib b (a+b)

primeFactors :: Integer -> [Integer]
primeFactors n =
  case factor of
    [] -> [n]
    [x] -> x : primeFactors (div n x)
  where
    factor = take 1 . filter (\ x -> mod n x == 0) $ [2 .. intRoot n]

intRoot :: Integer -> Integer
intRoot = floor . sqrt . fromInteger

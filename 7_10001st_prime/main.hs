-- What is the 10 001st prime number?

primeFactors :: Integer -> [Integer]
primeFactors n =
  case factor of
    [] -> [n]
    [x] -> x : primeFactors (div n x)
  where
    factor = take 1 . filter (\ x -> mod n x == 0) $ [2 .. intRoot n]

intRoot :: Integer -> Integer
intRoot = floor . sqrt . fromInteger

isPrime :: Integer -> Bool
isPrime n = primeFactors n == [n]

primes :: [Integer]
primes = filter isPrime [2..]

nthPrime :: Int -> Integer
nthPrime n = last $ take n primes

-- nthPrime 6 == 13
-- nthPrime 10001 == 104743

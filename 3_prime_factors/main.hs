-- What is the largest prime factor of the number 600851475143 ?

primeFactors :: Integral t => t -> [t]
primeFactors n =
  case factor of
    [] -> [n]
    [x] -> x : primeFactors (div n x)
  where
    factor = take 1 (filter (\ x -> mod n x == 0) [2 .. div n 2])

-- primeFactors 13195 == [5,7,13,29]

maximum (primeFactors 600851475143) == 6857

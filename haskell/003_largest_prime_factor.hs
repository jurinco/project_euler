-- What is the largest prime factor of the number 600851475143?
import Euler

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = maximum $ primeFactors n

test0 = largestPrimeFactor 13195 == 29

solution = largestPrimeFactor 600851475143 -- 6857

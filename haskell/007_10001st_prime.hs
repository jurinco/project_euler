-- What is the 10 001st prime number?
import Euler

nthPrime :: Int -> Integer
nthPrime n = last $ take n primes

test0 = nthPrime 6 == 13
solution = nthPrime 10001 -- 104743

-- Find the sum of all the primes below two million.

import Data.Numbers.Primes

solve lim = sum . takeWhile (< lim) $ primes

test0 = solve 10 == 17
solution = solve 2000000 -- 142913828922

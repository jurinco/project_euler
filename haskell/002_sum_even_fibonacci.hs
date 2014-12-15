-- Sum the even-valued terms of the Fibonacci sequence which have a value <= four million.
import Euler

sumEvenFibs :: Integer -> Integer
sumEvenFibs n = sum $ takeWhile (< n) $ filter even fibStream

test0 = sumEvenFibs 10 == 10
test1 = sumEvenFibs 20 == 10
test2 = sumEvenFibs 100 == 44
solution = sumEvenFibs 4000000 -- 4613732

-- Find the difference between the sum of the squares of the first
-- one hundred natural numbers and the square of the sum.

sumOfSquares :: Num a => [a] -> a
sumOfSquares = foldl1 (\ a x -> a + x ^ 2)

squareOfSum :: Num a => [a] -> a
squareOfSum = (^ 2) . sum

sumSqrDiff :: Num a => [a] -> a
sumSqrDiff xs = squareOfSum xs - sumOfSquares xs

test0 = sumSqrDiff [1..10] == 2640
solution = sumSqrDiff [1..100] -- 25164150

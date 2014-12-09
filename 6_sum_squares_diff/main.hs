sumOfSquares :: Num a => [a] -> a
sumOfSquares = foldl1 (\ a x -> a + x ^ 2)
-- sumOfSquares [1..10] == 385

squareOfSum :: Num a => [a] -> a
squareOfSum = (^ 2) . sum
-- squareOfSum [1..10] == 3025

sumSqrDiff :: Num a => [a] -> a
sumSqrDiff xs = squareOfSum xs - sumOfSquares xs
-- sumSqrDiff [1..10] == 2640

solution = sumSqrDiff [1..100] -- 25164150

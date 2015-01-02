-- Find the thirteen adjacent digits in the 1000-digit number that have the
-- greatest product. What is the value of this product?

import Data.Char
import Data.List

parse :: String -> [Int]
parse = map digitToInt . concat . lines

windows :: Int -> [Int] -> [[Int]]
windows n = map (take n) . tails

main = do
  let n = 13
  raw_data <- readFile "data.txt"
  let stream = parse raw_data
  print . maximum . map product . windows n $ stream

-- maxProductInStream 4 -- 5832
-- maxProductInStream 13 -- 23514624000

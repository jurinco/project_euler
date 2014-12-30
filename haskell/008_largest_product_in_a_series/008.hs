-- Find the thirteen adjacent digits in the 1000-digit number that have the
-- greatest product. What is the value of this product?

import Data.Char
import Data.List

maxProductInStream n = do
  contents <- readFile "data.txt"
  let stream = map digitToInt . concat . lines $ contents
  let windows = take (length stream - n) . map (take n) . tails $ stream
  let products = map product windows
  print $ maximum products

-- maxProductInStream 4 -- 5832
-- maxProductInStream 13 -- 23514624000

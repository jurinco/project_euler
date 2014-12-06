-- Find the largest palindrome made from the product of two 3-digit numbers.

-- Returns the largest palindrome made from the product of two d-digit numbers
solve d = maximum [p | x <- [lb..ub], y <- [x..ub], let p = x * y, palindrome (show p)]
  where
    lb = 10 ^ (d - 1)   -- lower bound
    ub = 10 ^ d - 1     -- upper bound
    palindrome s = s == reverse s

-- solve 2 == 9009
-- solve 3 == 906609

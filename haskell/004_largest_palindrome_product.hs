-- Find the largest palindrome made from the product of two 3-digit numbers.

-- Returns the largest palindrome made from the product of two d-digit numbers
largestPalindromeProduct d = maximum [p | x <- [lb..ub], y <- [x..ub], let p = x * y, palindrome (show p)]
  where
    lb = 10 ^ (d - 1)   -- lower bound
    ub = 10 ^ d - 1     -- upper bound
    palindrome s = s == reverse s

test0 = largestPalindromeProduct 1 == 9
test1 = largestPalindromeProduct 2 == 9009

solution = largestPalindromeProduct 3 -- 906609

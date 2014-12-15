module Euler
( fibs
) where

fibs = fib 1 2
  where
    fib a b = a : fib b (a+b)
-- take 10 fibStream == [1,2,3,5,8,13,21,34,55,89]

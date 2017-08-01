module Sieve (primesUpTo) where

primesUpTo :: Integer -> [Integer]
primesUpTo n = h [2..n] where
  h [] = []
  h (x:xs) = x : h (filter ((0 /=) . flip mod x) xs)

module PrimeFactors (primeFactors) where

import Data.Numbers.Primes hiding (primeFactors)

primeFactors :: Integer -> [Integer]
primeFactors n = h n primes [] where
  h 1 _ acc = reverse acc
  h n (x:xs) acc
    | mod n x == 0 = h (div n x) (x:xs) (x:acc)
    | otherwise = h n xs acc

-- primes = filter isPrime [2..]
-- isPrime n = all (==False) $ map ((==) 0 . mod n) [2..(n-1)]

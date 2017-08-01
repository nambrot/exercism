module SumOfMultiples (sumOfMultiples) where
import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub $ concatMap (f 1) factors where
  f i factor
    | i*factor < limit = i*factor : f (i+1) factor
    | otherwise = []


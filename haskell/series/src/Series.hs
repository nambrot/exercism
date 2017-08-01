module Series (slices) where

import Data.Char (digitToInt)

slices :: Int -> String -> [[Int]]
slices 0 _ = [[]]
slices n xss
  | length xss < n = []
  | otherwise = convert (take n xss) : slices n (tail xss)

convert = map digitToInt


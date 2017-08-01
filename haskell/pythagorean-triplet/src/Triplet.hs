module Triplet (isPythagorean, mkTriplet, pythagoreanTriplets) where
import Data.List (sort)

isPythagorean :: (Int, Int, Int) -> Bool
isPythagorean (a, b, c) = sum (map (^2) lowers) == top ^ 2 where
    lowers = take 2 $ sort [a, b, c]
    top = foldl max a [a, b, c]

mkTriplet :: Int -> Int -> Int -> (Int, Int, Int)
mkTriplet a b c = (a, b, c)

pythagoreanTriplets :: Int -> Int -> [(Int, Int, Int)]
pythagoreanTriplets minFactor maxFactor = filter isPythagorean source where
  source = [mkTriplet a b c | a <- [minFactor .. maxFactor],
                              b <- [a .. maxFactor],
                              c <- [b .. maxFactor]]

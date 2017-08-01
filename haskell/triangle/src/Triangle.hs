module Triangle (TriangleType(..), triangleType) where

import Data.List

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: Real a => a -> a -> a -> TriangleType
triangleType a b c
  | doesNotSatifyTriangleInequality $ sort [a, b, c] = Illegal
  | otherwise = case length $ filter id [ a == b, b == c, a == c] of
                  3 -> Equilateral
                  1 -> Isosceles
                  _ -> Scalene
  where
    doesNotSatifyTriangleInequality [a, b, c] = a + b <= c


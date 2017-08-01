module Acronym (abbreviate) where
import Data.Char

abbreviate :: String -> String
abbreciate [] = []
abbreviate (x:xs) = toUpper x : f xs where
    f [] = []
    f [x] = []
    f (x:y:xs)
      | x == '-' || isSpace x || isLower x && isUpper y = toUpper y : f xs
      | otherwise = f (y:xs)

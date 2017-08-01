module Pangram (isPangram) where
import Data.Char

isPangram :: String -> Bool
isPangram text = all (isIn $ toLowerCase text) ['a'..'z']

isIn = flip elem
toLowerCase = map toLower

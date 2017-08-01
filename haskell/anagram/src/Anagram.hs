module Anagram (anagramsFor) where

import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = nub $ filter (isAnagramOf xs) xss where
    isAnagramOf word copy = mod word == mod copy && l word /= l copy
    l = map toLower
    mod = sort . l

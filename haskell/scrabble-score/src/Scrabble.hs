module Scrabble (scoreLetter, scoreWord) where

import Data.Char
import Data.Maybe
import Data.Map (Map, fromList)
import qualified Data.Map as Map

scoreLetter :: Char -> Integer
scoreLetter letter
  | l `elem` "aeioulnrst" = 1
  | l `elem` "dg" = 2
  | l `elem` "bcmp" = 3
  | l `elem` "fhvwy" = 4
  | l `elem` "k" = 5
  | l `elem` "jx" = 8
  | l `elem` "qz" = 10
  | otherwise = 0
    where l = toLower letter

scoreWord :: String -> Integer
scoreWord xs = sum $ map scoreLetter xs

module Atbash (decode, encode) where

import Data.Char (isLetter, isNumber, toLower)

decode :: String -> String
decode = concatMap flipChar

encode :: String -> String
encode = unwords . slices . concatMap flipChar where
  slices [] = []
  slices x = take 5 x : slices (drop 5 x)


flipChar x
    | isLetter x = [toEnum $ (219-) $ fromEnum $ toLower x]
    | isNumber x = [x]
    | otherwise = []

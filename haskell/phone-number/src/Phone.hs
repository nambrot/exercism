module Phone (number) where

import Data.Char

number :: String -> Maybe String
number xs = do
  (h:t) <- return $ filter isDigit xs
  numbers <- if h == '1' then return t else return (h:t)
  if length numbers /= 10
    then Nothing
    else do
      (d1:d2:d3:d4:xs) <- return numbers
      if elem d1 ['2'..'9'] && elem d4 ['2'..'9']
        then return numbers
        else Nothing

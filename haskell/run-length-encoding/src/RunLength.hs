module RunLength (decode, encode) where
import Data.Char

decode :: String -> String
decode = decodeH 0

encode :: String -> String
encode [] = []
encode (char:xs) = encodeH (char, 1) xs

type Entry = (Char, Int)

encodeH :: Entry -> String -> String
encodeH entry [] = serialize entry
encodeH entry@(char, i) (nextChar : xs)
  | char == nextChar = encodeH (char, i+1) xs
  | otherwise = serialize entry ++ encodeH (nextChar, 1) xs

serialize :: Entry -> String
serialize (char, 1) = [char]
serialize (char, num) = show num ++ [char]

decodeH :: Int -> String -> String
decodeH i [] = []
decodeH i (char:xs)
  | isDigit char = decodeH (10 * i + digitToInt char) xs
  | i == 0 = char : decode xs
  | otherwise = replicate i char ++ decode xs

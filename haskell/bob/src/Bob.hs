module Bob (responseFor) where
import Data.Char

justWhiteSpace :: String -> Bool
justWhiteSpace = all isSpace

allCaps xs = all isUpper (filter isLetter xs) && any isLetter xs

isQuestion :: String -> Bool
isQuestion = (==) '?' . last . filter (not . isSpace)

responseFor :: String -> String
responseFor xs
  | justWhiteSpace xs = "Fine. Be that way!"
  | allCaps xs = "Whoa, chill out!"
  | isQuestion xs = "Sure."
  | otherwise = "Whatever."

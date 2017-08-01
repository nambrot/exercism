module Series (largestProduct) where
import Data.Char (digitToInt, isNumber)

largestProduct :: Int -> String -> Maybe Integer
largestProduct size digits
  | size == 0 = Just 1
  | size < 0 || size > length digits = Nothing
  | any (not . isNumber) digits = Nothing
  | otherwise = Just $ h $ map (toInteger . digitToInt) digits where
      h l
        | size == length l = product l
        | otherwise = max (product $ take size l) $ h $ drop 1 l

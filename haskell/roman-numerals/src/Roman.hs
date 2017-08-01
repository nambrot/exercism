module Roman (numerals) where

import Control.Monad.State

numerals :: Integer -> Maybe String
numerals = num . fromIntegral where
  num n
    | n > 3000 = Nothing
    | otherwise = execState monad Nothing where
      r char n factor = replicate (div n factor) char
      s string _ _ = string
      monad = foldM f n [ (1000, r 'M')
                        , (900, s "CM")
                        , (500, s "D")
                        , (400, s "CD")
                        , (100, r 'C')
                        , (90, s "XC")
                        , (50, s "L")
                        , (40, s "XL")
                        , (10, r 'X')
                        , (9, s "IX")
                        , (5, s "V")
                        , (4, s "IV")
                        , (1, r 'I')
                        ]

f :: Int -> (Int, Int -> Int -> String) -> State (Maybe String) Int
f n (factor, stringFactory) = do {
    let
      string = stringFactory n factor
      remainder = mod n factor
    ; when (n >= factor) $ modify (`mappend` Just string)
    ; return remainder
  }

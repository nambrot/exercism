module SecretHandshake (handshake) where

import Control.Monad.State
import Data.Bits

handshake :: Int -> [String]
handshake n
  | n > 31 || n <= 0 = []
  | otherwise = execState monad [] where
    g n modF = do {
      ; when (testBit n 0) $ modify modF
      ; return $ shiftR n 1
    }
    monad = foldM g n [ (++ ["wink"])
                      , (++ ["double blink"])
                      , (++ ["close your eyes"])
                      , (++ ["jump"])
                      , reverse]

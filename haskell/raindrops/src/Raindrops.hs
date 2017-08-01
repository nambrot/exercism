module Raindrops (convert) where

import Control.Monad.State

convert :: Int -> String
convert n = evalState monad ""
  where
    monad = do  { when (mod n 3 == 0) $ modify (++ "Pling")
                ; when (mod n 5 == 0) $ modify (++ "Plang")
                ; when (mod n 7 == 0) $ modify (++ "Plong")
                ; x <- get
                ; if null x
                    then return $ show n
                    else return x
                }

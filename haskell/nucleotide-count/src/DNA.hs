module DNA (nucleotideCounts) where

import Data.Map (Map, fromList, insertWith, singleton, unionWith)

newtype Mon = Mon (Either String (Map Char Int)) deriving (Show)

instance Monoid Mon where
   mempty = Mon $ Right $ fromList [ ('A', 0)
                                   , ('C', 0)
                                   , ('G', 0)
                                   , ('T', 0) ]
   (Mon (Right xs)) `mappend` (Mon (Right ys)) = Mon $ Right $ unionWith (+) xs ys
   x@(Mon (Left _)) `mappend` _ = x
   _ `mappend` x@(Mon (Left _)) = x


nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts = unwrap . mconcat . map (Mon . f) where
                                      f x
                                        | x `elem` "ACGT" = Right $ singleton x 1
                                        | otherwise = Left "None"

unwrap :: Mon -> Either String (Map Char Int)
unwrap (Mon a) = a

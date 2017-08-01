module Allergies (Allergen(..), allergies, isAllergicTo) where

import Data.Bits
import Data.Maybe (fromJust)
import Data.List (elemIndex)
import Control.Arrow (second)
data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq, Show, Enum)

allergies :: Int -> [Allergen]
allergies score = map fst $ filter snd $ zip [Eggs ..] $ map (testBit score) [0 ..]

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score = testBit score $ fromEnum allergen

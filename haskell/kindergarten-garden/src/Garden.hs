module Garden
    ( Plant (..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where

import Data.Map (Map, fromListWith)
import qualified Data.Map as Map
import Data.Maybe
import Data.List (sort)
import Control.Arrow

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

toPlant 'C' = Clover
toPlant 'G' = Grass
toPlant 'R' = Radishes
toPlant 'V' = Violets
toPlant _ = error "Couldnt map"

defaultGarden :: String -> Map String [Plant]
defaultGarden = garden [ "Alice"
                       , "Bob"
                       , "Charlie"
                       , "David"
                       , "Eve"
                       , "Fred"
                       , "Ginny"
                       , "Harriet"
                       , "Ileana"
                       , "Joseph"
                       , "Kincaid"
                       , "Larry"
                       ]

garden :: [String] -> String -> Map String [Plant]
garden students = toMap . concatMap convert . lines
    where orderedStudents = concat [ [x, x] | x <- sort students]
          convert = zipWith zipper orderedStudents
          zipper student plantChar = (student, [toPlant plantChar])
          toMap = fromListWith (flip (++))
lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants student garden = fromMaybe [] $ Map.lookup student garden


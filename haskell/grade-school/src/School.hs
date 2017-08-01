module School (School, add, empty, grade, sorted) where
import Data.Map (Map, fromList, insertWith, singleton, unionWith, toList)
import Data.List (sort)
import Control.Arrow (second)

import qualified Data.Map as M
type Grade = Int
type Name = String
type Student = (Grade, Name)
type School = [Student]

add :: Int -> String -> School -> School
add gradeNum student = (:) (gradeNum, student)

empty :: School
empty = []

grade :: Int -> School -> [String]
grade gradeNum = sort . map snd . filter ((gradeNum ==) . fst)

sorted :: School -> [(Int, [String])]
sorted = map (second sort) . toList . foldl (unionWith (++)) M.empty . map (\(a, b) -> singleton a [b])

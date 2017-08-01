module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import Data.Vector (Vector)
import qualified Data.Vector as Vector

newtype Matrix a = Matrix [[a]] deriving (Eq, Show)

cols :: Matrix a -> Int
cols (Matrix []) = 0
cols (Matrix (x:_)) = length x

column :: Int -> Matrix a -> Vector a
column x (Matrix matrix) = Vector.fromList $ map (!! x) matrix

flatten :: Matrix a -> Vector a
flatten (Matrix matrix) = Vector.fromList $ concat matrix

fromList :: [[a]] -> Matrix a
fromList = Matrix

fromString :: Read a => String -> Matrix a
fromString = Matrix . map parseRow . lines where
    parseRow = map read . words

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (rows, cols) (Matrix matrix) = Matrix $ h $ concat matrix where
    h [] = []
    h l = take cols l : h (drop cols l)

row :: Int -> Matrix a -> Vector a
row x (Matrix matrix) = Vector.fromList $ matrix !! x

rows :: Matrix a -> Int
rows (Matrix matrix) = length matrix

shape :: Matrix a -> (Int, Int)
shape matrix = (rows matrix, cols matrix)

transpose :: Matrix a -> Matrix a
transpose (Matrix matrix) = Matrix $ h matrix where
    h xss@(x:xs)
        | null x = []
        | otherwise = map head xss : h (map tail xss)


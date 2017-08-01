module Matrix (saddlePoints) where

import Data.Array (Array, Ix, range, bounds, (!))

saddlePoints :: (Ix i, Ord e) => Array (i, i) e -> [(i, i)]
saddlePoints matrix = [ (row, col) | row <- rows
                                   , col <- cols
                                   , let val = matrix ! (row, col)
                                   , all ((val >=) . (matrix!) . (,) row) cols
                                   , all ((val <=) . (matrix!) . flip (,) col) rows
                      ] where
                          ((rowMin, colMin), (rowMax, colMax)) = bounds matrix
                          rows = range (rowMin, rowMax)
                          cols = range (colMin, colMax)

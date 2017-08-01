module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not . p)

keep :: (a -> Bool) -> [a] -> [a]
keep p [] = []
keep p (x:xs) = if p x then x : keep p xs else keep p xs


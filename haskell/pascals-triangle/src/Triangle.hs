module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x
  | x <= 0 = []
  | otherwise = take x $ h [] where
    h [] = [1] : h [1]
    h acc = next : h next where
      next = zipWith (+) (acc ++ [0]) (0:acc)

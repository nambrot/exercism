module Base (rebase) where
import Control.Applicative (liftA2)
import Control.Monad (guard)

rebase :: Integral a => a -> a -> [a] -> Maybe [a]
rebase inputBase outputBase inputDigits = do
  let
    factors = map (inputBase ^) [0..]
    from10 0 = []
    from10 x = let
        digit = x `mod` outputBase
        remainder = x `div` outputBase
        in
          digit : from10 remainder
  guard (inputBase >= 2)
  guard (outputBase >= 2)
  guard $ all (>=0) inputDigits
  guard $ all (<inputBase) inputDigits

  return $ reverse $ from10 $ sum $ zipWith (*) factors $ reverse inputDigits

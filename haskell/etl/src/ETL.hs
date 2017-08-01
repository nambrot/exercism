module ETL (transform) where
import Data.Char
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Monoid

transform :: Map a String -> Map Char a
transform = mconcat . concatMap f . Map.toList where
  f (k, v) = map ((`Map.singleton` k) . toLower) v

module DNA (toRNA) where
import qualified Data.Foldable as F
import Control.Monad

toRNA :: String -> Maybe String
-- toRNA ('G':xs) = Just("C"++) <*> toRNA xs
-- toRNA ('C':xs) = Just("G"++) <*> toRNA xs
-- toRNA ('T':xs) = Just("A"++) <*> toRNA xs
-- toRNA ('A':xs) = Just("U"++)  <*> toRNA xs
-- toRNA [] = Just []
-- toRNA _ = Nothing

-- toRNA ('G':xs) = fmap ('C':) (toRNA xs)
-- toRNA ('C':xs) = fmap ('G':) (toRNA xs)
-- toRNA ('T':xs) = fmap ('A':) (toRNA xs)
-- toRNA ('A':xs) = fmap ('U':) (toRNA xs)
-- toRNA [] = Just []
-- toRNA _ = Nothing

-- toRNA ('G':xs) = toRNA xs >>= \x -> return ('C':x)
-- toRNA ('C':xs) = toRNA xs >>= \x -> return ('G':x)
-- toRNA ('T':xs) = toRNA xs >>= \x -> return ('A':x)
-- toRNA ('A':xs) = toRNA xs >>= \x -> return ('U':x)
-- toRNA [] = Just []
-- toRNA _ = Nothing

-- toRNA ('G':xs) = toRNA xs >>= (return . ('C':))
-- toRNA ('C':xs) = toRNA xs >>= \x -> return ('G':x)
-- toRNA ('T':xs) = toRNA xs >>= \x -> return ('A':x)
-- toRNA ('A':xs) = toRNA xs >>= \x -> return ('U':x)
-- toRNA [] = Just []
-- toRNA _ = Nothing

-- found online
-- toRNA = traverse transcribe
--   where transcribe c = case c of
--           'G' -> Just 'C'
--           'C' -> Just 'G'
--           'T' -> Just 'A'
--           'A' -> Just 'U'
--           _ -> Nothing

toRNA = mapM complement
  where
    complement 'C' = Just 'G'
    complement 'G' = Just 'C'
    complement 'T' = Just 'A'
    complement 'A' = Just 'U'
    complement x = Nothing

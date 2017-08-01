module Brackets (arePaired) where

arePaired :: String -> Bool
arePaired = isJust . m where
  m xs = do {
    acc <- foldM f [] xs
    ; guard $ acc == []
    ; return acc
  }
  f parens@(lastParen:parenss) char
    | char `elem` "{[(" = Just $ char:parens
    | char `elem` ")}]" && matches lastParen char = Just parenss
    | char `elem` ")}]" = Nothing
    | otherwise = Just parens
  matches '{' '}' = True
  matches '[' ']' = True
  matches '(' ')' = True
  matches _ _ = false

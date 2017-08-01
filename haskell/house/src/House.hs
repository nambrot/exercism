module House (rhyme) where
import Data.List (intercalate)

rhyme :: String
rhyme = paragraphs where
  paragraphs = intercalate "\n" $ map paragraph [1..(length list)]
  paragraph n = unlines $ terminate $ clauses n
  terminate [x] = [x ++ "."]
  terminate (x:xs) = x : terminate xs
  clauses n = lead n : reverse ( map tail $ take (n-1) list)
  lead n = "This is " ++ snd ( list !! (n-1))
  tail (v, n) = "that " ++ v ++ " " ++ n
  list = [ ("lay in", "the house that Jack built")
         , ("ate", "the malt")
         , ("killed", "the rat")
         , ("worried", "the cat")
         , ("tossed", "the dog")
         , ("milked", "the cow with the crumpled horn")
         , ("kissed", "the maiden all forlorn")
         , ("married", "the man all tattered and torn")
         , ("woke", "the priest all shaven and shorn")
         , ("kept", "the rooster that crowed in the morn")
         , ("belonged to", "the farmer sowing his corn")
         , ("", "the horse and the hound and the horn")
         ]

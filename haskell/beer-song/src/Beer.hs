module Beer (song) where
import Data.List

song :: String
song =  intercalate "\n" $ verse 99 where
  bottles 1 = "1 bottle of beer"
  bottles n = show n ++ " bottles of beer"

  verse 0 = [ "No more bottles of beer on the wall, no more bottles of beer."
            , "Go to the store and buy some more, 99 bottles of beer on the wall."
            , ""
            ]
  verse 1 = [ "1 bottle of beer on the wall, 1 bottle of beer."
            , "Take it down and pass it around, no more bottles of beer on the wall."
            , ""
            ] ++ verse 0
  verse n = [ bottles n ++ " on the wall, " ++ bottles n ++ "."
            , "Take one down and pass it around, " ++ bottles (n-1) ++ " on the wall."
            , ""
            ] ++ verse (n-1)

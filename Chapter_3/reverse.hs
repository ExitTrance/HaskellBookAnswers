-- reverse.hs
module Reverse where


rvrs :: String -> String
rvrs myString = x ++ " " ++ y ++ " " ++ z ++ "."
  where
        x = drop 9 myString 
        y = take 2 $ drop 6 myString
        z = take 5 myString

main :: IO()
main = print $ rvrs "Curry is awesome"
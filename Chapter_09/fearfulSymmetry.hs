-- fearfulSymmetry.hs
module FearfulSymmetry where


myWords :: String -> [String]
myWords text 
  | text == ""  = []
  | otherwise   = takeWhile (/= ' ') text : myWords (  dropWhile (== ' ') $ dropWhile (/= ' ') text )
-- In the catch-all case, in the recursive part, I get the remaining string and drop the white space
-- with dropWhile. 

-- wordNumber.hs
module WordNumber where

import Data.List(intersperse)

digitToWord :: Int -> String
digitToWord n = 
  case n of
    0 -> "zero"
    1 -> "one" 
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "9"

    
digits :: Int -> [Int]
digits n = go n []
  where go n list
         | n < 10 = n:list
         | otherwise = go (div n 10) ((mod n 10):list)


wordNumber :: Int -> String
wordNumber n = concat . intersperse "-" . map digitToWord $ digits n

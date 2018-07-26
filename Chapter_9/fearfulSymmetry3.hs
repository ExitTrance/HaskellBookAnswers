-- fearfulSymmetry3.hs
module FearfulSymmetry3 where

sentence  = "all i wanna do is have some fun"

firstSen  = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen
         ++ thirdSen ++ fourthSen

delimiter :: String -> Char
delimiter x 
  | (takeWhile (== '\n') $ dropWhile (/= '\n') x)  == "\n" = '\n'
  | otherwise = ' '

-- Covers both myWords and myLines. 
-- Uses helper function 'go' to use 'delimiter' function.  
myWL :: String -> [String]
myWL text = go text (delimiter text)
  where go text d
         | text == "" = []
         | otherwise  = takeWhile (/= d) text : go (dropWhile (== d) $ (dropWhile (/= d) text)) d
         
-- What we want 'myLines sentences' to equal
shouldEqual = 
  ["all","i","wanna","do","is","have","some","fun"]

shouldEqual2 =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

  
main :: IO ()
main = do 
  print $ "myWords -> Are they equal? "
          ++ show (myWL sentence == shouldEqual)
  print $ "myLines -> Are they equal? "
          ++ show (myWL sentences == shouldEqual2)  




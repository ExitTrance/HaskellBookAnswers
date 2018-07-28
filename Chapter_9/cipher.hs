-- cipher.hs
module Cipher where
import Data.Char


-- This code is incredibly error prone if not enough care 
-- is taking with the values supplied to mod. 

-- If I were to write this again, I would probably use a function
-- to handle the modular arithmetic, as there are common values,
-- between the functions.

caesar :: Int -> String -> String
caesar _ [] = []
caesar shift (x:xs) 
  | isUpper x = (chr $ (mod (mod (ord x + shift) 65) 26) + 65) : caesar shift xs
  | otherwise = (chr $ (mod (mod (ord x + shift) 97) 26) + 97) : caesar shift xs

unCaesar :: Int -> String -> String
unCaesar _ [] = []
unCaesar shift (x:xs)
  | isUpper x = (chr $ (mod (mod (ord x + (26 - shift) ) 65) 26) + 65) : unCaesar shift xs
  | otherwise = (chr $ (mod (mod (ord x + (26 - shift) ) 97) 26) + 97) : unCaesar shift xs
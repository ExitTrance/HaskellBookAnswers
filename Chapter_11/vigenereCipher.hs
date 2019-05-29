-- vigenereCipher.hs
import Data.Char

type Key     = String
type Message = String

-- Shift helper function
caesar :: Int -> Char -> Char
caesar shift x
  | isUpper x = (chr $ (mod (mod (ord x + shift) 65) 26) + 65)
  | otherwise = (chr $ (mod (mod (ord x + shift) 97) 26) + 97)

-- Performs the actual vigenere functionality
vigenere' :: Key -> Message -> Message
vigenere' _ [] = []
vigenere' key@(y:ys) (x:xs)
  | isSpace x = ' ' : vigenere' key xs
  | otherwise = caesar (ord y) x : vigenere' ys xs

-- Actual function that needs to be called to provide
-- arguments to the vigenere' function.
-- Used only because of the cycle function on the key.
-- vigenere' can be called on it's own.
vigenere :: Key -> Message -> Message
vigenere y x = vigenere' (cycle y) x





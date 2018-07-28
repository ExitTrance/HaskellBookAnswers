# Chapter Exercises

## Data Char

##### 1
```haskell
isUpper :: Char -> Bool
```

```haskell
toUpper :: Char -> Char
```
##### 2
```haskell
filterUpper = filter isUpper
```

##### 3 & 4

```haskell
import Data.Char

firstUpper :: [Char] -> [Char]
firstUpper []     = []
firstUpper (x:xs) = toUpper x : xs 

firstUpper' :: [Char] -> [Char]
firstUpper' []     = []
firstUpper' (x:xs) = toUpper x : firstUpper' xs
```
##### 5 & 6
```haskell 
-- Already composed and pointfree.
headUpper = toUpper . head
```

## Ciphers

```haskell
-- cipher.hs
module Cipher where
import Data.Char


-- This code is incredibly error prone if not enough care 
-- is taking with the values supplied to mod. However,
-- it does work with both upper case and lower case letters,
-- and does not lose them during encryption and decryption.

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

```
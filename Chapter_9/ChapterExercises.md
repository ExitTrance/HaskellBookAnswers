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

## Writing your own standard functions

```haskell
-- standardFunctions.hs
module StandardFunctions where

-- 1
myOr :: [Bool] -> Bool  
myOr []     = False
myOr (x:xs) = x || myOr xs 

-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs 

-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem t (x:xs) = t == x || myElem t xs 

myElemAny :: Eq a => a -> [a] -> Bool
myElemAny _ []     = False
myElemAny t xs = any (== t) xs

-- 4
myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x] 

-- 5
squish :: [[a]] -> [a]
squish []     = []
squish (x:xs) = x ++ squish xs 

-- 6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs 

-- 7
squishAgain :: [[a]] -> [a]
squishAgain [] = []
squishAgain xs = squishMap (\x -> x) xs

-- 8
-- Does not work on empty lists.
myMaximumBy ::  (a -> a -> Ordering) -> [a] -> a   
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:y:ys)
  | f x y == GT = myMaximumBy f (x:ys)
  | otherwise   = myMaximumBy f (y:ys)

-- 9
-- Does not work on empty lists.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy f (x:y:ys)
  | f x y == LT = myMinimumBy f (x:ys)
  | otherwise   = myMinimumBy f (y:ys)

-- 10?
myMaximum :: (Ord a) => [a] -> a    
myMaximum xs = myMaximumBy compare xs 

myMinimum :: (Ord a) => [a] -> a
myMinimum xs = myMinimumBy compare xs
```
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


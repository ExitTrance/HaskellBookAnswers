# Chapter Exercises

##  Warm-up and Review  

##### 1
```haskell
-- a
stops = "pbtdkg"
vowels = "aeiou"

svs  = [(s, v, s) | s <- stops, v <- vowels]
```

```haskell
-- b
stops = "pbtdkg"
vowels = "aeiou"

svs2 = [(s1, v, s2) | s1 <- "p", 
                      v  <- vowels, 
                      s2 <- stops]
```

```haskell
-- c
nouns = ["cat", "dog", "knife", "laptop", "person"]
verb  = ["kill", "love", "nurture", "embrace", "push"]

nvn = [(n, v, n) | n <- nouns, v <- verb]
```

##### 2
```haskell
-- seekritFunc :: [Char] -> Int
-- Amount of characters of words in a given string, 
-- divided (integer division) by the number of words.
seekritFunc x =
  div (sum (map length (words x)))
      (length (words x))
```


##### 3
```haskell
seekritFunc2 x = fromIntegral (sum (map length (words x))) / 
                 fromIntegral (length (words x))
```


## Rewriting functions using folds

```haskell

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False
-- myAny even [1, 3, 5] false
-- myAny odd [1, 3, 5] true

myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr ((||) . \y -> y == x) False

myElemAny :: Eq a => a -> [a] -> Bool
myElemAny x = any (== x)

myReverse :: [a] -> [a]
myReverse = foldr (\x -> (++ [x])) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x xs -> if f x then x : xs else xs) []


squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++). f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id


-- Provided tests run with expected results.
-- By setting the default case as the last element in the list
-- This solution is not safe as it does not account for the empty list!
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f list = foldr (\a b -> if f a b == GT then a else b) end beginning
  where
    end       = last list
    beginning = init list

-- Exactly the same as myMaximumBy except the Ordering value inside conditional.
-- Not safe.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f list = foldr (\a b -> if f a b == LT then a else b) end beginning
  where
    end       = last list
    beginning = init list


```


##### 

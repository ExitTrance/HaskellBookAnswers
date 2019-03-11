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




##### 

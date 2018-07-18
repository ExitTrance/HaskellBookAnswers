# Chapter Exercises

## Review of types

**1. What is the type of [[True, False], [True, True], [False, True]]?**        \
   `d) [[Bool]]` 

**2. Which of the following has the same type as [[True, False], [True, True], [False, True]]?**\
   `b) [[3 == 3], [6 > 5], [3 < 4]]`

**3. For the following function, which of the following is true?**\
```haskell
 func :: [a] -> [a] -> [a]          
 func x y = x ++ y
```
   `d) all of the above`
   
**4. For the func code above, which is a valid application of func to both of its arguments?**\
   `b) func "Hello" "World"`
 

## Reviewing currying

Given the following definitions, tell us what value results from further applications

```haskell
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String -> String
frappe = flippy "haha"
```

**1. What is the value of appedCatty "woohoo!" ?**\
`"woops mrow woohoo"`

**2. frappe "1"**\
`"1 mrow haha"`

**3. frappe (appedCatty "2")**\
`"woops mrow 2 mrow haha "`

**4. appedCatty (frappe "blue")**\
`"woops mrow blue mrow haha"`

**5. cattyConny (frappe "pink")(cattyConny "green" (appedCatty "blue"))**\
`"pink mrow haha mrow green mrow woops mrow blue"`

**6. cattyConny (flippy "Pugs" "are") "awesome"**\
`"are mrow Pugs mrow awesome"`

## Recursion

```haskell
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)
```

**1. Write out the steps for reducing dividedBy 15 2 to its final answer
according to the Haskell code.**

```haskell
go (15 - 2) 2 (0 + 1)
go (13 - 2) 2 (1 + 1)
go (11 - 2) 2 (2 + 1)
go ( 9 - 2) 2 (3 + 1)
go ( 7 - 2) 2 (4 + 1)
go ( 5 - 2) 2 (5 + 1)
go ( 3 - 2) 2 (6 + 1)
(1, 7)
```         

**2. Write a function that recursively sums all numbers from 1 to n, n being the argument.
So that if n was 5, you’d add 1 + 2 + 3 + 4 + 5 to get 15. The type should be (Eq a, Num a) => a -> a.**

```haskell
sumNum :: (Eq a, Num a) => a -> a
sumNum 1 = 1 
sumNum x = x + sumNum (x - 1)   
```

**3. Write a function that multiplies two integral numbers using
recursive summation. The type should be (Integral a) => a ->
a -> a.**

```haskell
-- Also covers the case 0, but crashes with negative numbers.   
multSum ::  (Integral a) => a -> a -> a
multSum num denom = go num denom 0 0 
  where go n d count sum
         | count == n = sum
         | otherwise = go n d (count + 1) (sum + d) 
```

## Fixing dividedBy

```haskell
data DividedResult = 
    Result Integer
  | DividedByZero deriving Show

dividedBy :: Integral a => a -> a -> DividedResult
dividedBy num denom = go num denom 0
  where go n d count
         | d == 0 = DividedByZero 
         | abs n < abs d = Result count
         | n < 0 && d < 0 = go (n - d) d (count + 1) -- neg neg
         | n > 0 && d > 0 = go (n - d) d (count + 1) -- pos pos
         | otherwise = go (n + d) d (count - 1) -- neg pos | pos neg

```


## McCarthy 91 function
```haskell
mc91 :: Integral a => a -> a
mc91 x 
  | x > 100 = x - 10
  | otherwise = mc91 . mc91 $ x + 11
```

## Numbers into words
```haskell
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
```
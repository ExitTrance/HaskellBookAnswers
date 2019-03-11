-- guardDuty.hs
module GuardDuty where

-- 1 Ordering matters. The otherwise case will be executed instead of the ones after it.

-- 2 Ordering matters just like in pattern matching. The top case, if executed, takes precedence.
-- Typechecks just fine.
avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x 
  | y >= 0.9  = 'A'
  | y >= 0.8  = 'B'
  | y >= 0.7  = 'C'
  | y >= 0.59 = 'D'
  | otherwise = 'F'
  where y = x / 100


-- 3 True when xs is a palindrome (B)
-- 4 Can take any type that can be used inside a list [a].
-- 5 pal :: Eq a => [a] -> Bool
pal xs
  | xs == reverse xs = True
  | otherwise        = False


-- 6 An indication of whether its argument is a positive, negative or zero value. (c)
-- 7 Type num
-- 8 numbers :: Num a => a -> a 
--   Not quite right as Num does not have a type constraint on Ord. Also, The type of the first argument could be a fraction for example,
--   whereas the output never changes, and is always just a Num and does not need a type constraint on Ord.
--   So, it should be described as possibly having a different type such that:
--   numbers :: (Ord a, Num a, Num b) => a -> b
numbers x
  | x < 0  = -1
  | x == 0 = 0
  | x > 0  = 1
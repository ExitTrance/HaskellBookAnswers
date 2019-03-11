-- chapterEx.hs
module ChapterEx where


-- Example:
--   isPalindrome "madam"
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x


-- Example: 
--   myAbs (-5)
--   myAbs 10 
myAbs :: Integer -> Integer
myAbs x = 
  if x >= 0 
    then x
  else
    (-x)


    
-- Example:
--   f ('a', 'b') ('c', 'd')
f :: (a,b) -> (c,d) -> ((b,d), (a,c))
f tup1 tup2 = ((first, second), (third, fourth))
  where 
    first   = snd tup1
    second  = snd tup2
    third   = fst tup1
    fourth  = fst tup2


-- Correcting Syntax Exercises

-- Ex1
x = (+)
addOne xs = w `x` 1
  where w = length xs

-- Ex2
-- Not sure what the book is asking here, it does not compile for me if I don't name it.
-- Seems to just be the id function in lambda. Naming it works, but the \ for anon functions part throws me off.
-- (\x->x) should be the correct lambda abstraction.
lambda1 = (\x->x)

-- Ex3
-- Here it was a matter of using parantheses around the x:xs part
-- Same as the previous question, it requires naming and parantheses for ghci to not throw errors. 
lambda2 = (\(x:xs) -> xs)

-- Ex4
-- A comma and lowercase letter saving the day. 
f2 (a, b) = a


-- Matching function names to types exercise

-- 1 c

-- 2 b

-- 3 a

-- 4 d


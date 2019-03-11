-- determineFunction.hs
module DetermineFunction where

-- 1
i :: a -> a
i x = x

-- 2
c :: a -> b -> a
c x y = x 

-- 3 c'' and c are the same!
c'' :: b -> a -> b
c'' x y = x

-- 4
c' :: a -> b -> b
c' x y = y

-- 5
r :: [a] -> [a]
r [x] = [x] 
-- r x = x
-- r x = []

-- 6
co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB x = bToC $ aToB x

-- 7
a :: (a -> c) -> a -> a
a _ x = x 
  

-- 8
a' :: (a -> b) -> a -> b
a' aToB x = aToB x


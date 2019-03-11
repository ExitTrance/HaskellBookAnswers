-- grabABag.hs
module GrabABag where

---- 1 
--   1, 2, and 3 are the same.
mTh1 x y z = x * y * z
mTh2 x y = \z -> x * y * z
mTh3 x = \y -> \z -> x * y * z
mTh4 = \x -> \y -> \z -> x * y * z

---- 2 
--   Num a => a -> a -> a

---- 3
--a
addOneIfOdd n = case odd n of 
  True -> f n
  False -> n
  where f = \n -> n + 1

--b
addFive = \x -> \y -> (if x > y then y else x) + 5

--c
mflip f x y = f y x 


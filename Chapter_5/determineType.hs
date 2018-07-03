-- determineType.hs
{-# LANGUAGE NoMonomorphismRestriction #-}
module DetermineType where

--------- 1

----- a
--- 54
--- func1 :: Num a => a
func1 = (*9 ) 6

----- b
--- (0, "doge")
--- func2 :: Num t => (t, [Char]) 
func2 = head [(0, "doge"), (1, "kitteh")]

----- c
--- (0, "doge")
--- func3 :: (Integer, [Char])
func3 = head [(0 :: Integer, "doge"), (1, "kitteh")]

----- d
--- False
--- func4 :: Bool
func4 = if False then True else False

----- e
--- 5
--- func5 :: Int
func5 = length [1..5]

----- f
--- False
--- func6 :: Bool
func6 = (length [1..4]) > (length "TACOCAT")


--------- 2
--- w :: Num a => a
x = 5
y = x + 5
w = y * 10

--------- 3
--- z :: Num => a -> a 
z y = y * 10

--------- 4
--- f :: Fractional a => a
f = 4 / y

--------- 5
--- f' :: [Char]
x' = "Julie"
y' = " <3 "
z' = "Haskell"
f' = x' ++ y' ++ z'
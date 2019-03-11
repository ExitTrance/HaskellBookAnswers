-- comprehendThyList.hs
module ComprehendThyList where

-- [1, 4, 9, 16, 25]
mySqr = [x^2 | x <- [1..5]]


-- 1 [4, 16]
roundedSqr = [x | x <- mySqr, rem x 2 == 0]

-- 2 [] 
nothing = [(x, y) | x <- mySqr, y <- mySqr, x < 50,  y > 50]

-- 3 []
nothing2 = take 5 [ (x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50 ]
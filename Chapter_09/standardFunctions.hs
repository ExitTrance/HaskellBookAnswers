-- standardFunctions.hs
module StandardFunctions where

-- 1
myOr :: [Bool] -> Bool  
myOr []     = False
myOr (x:xs) = x || myOr xs 

-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs 

-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem t (x:xs) = t == x || myElem t xs 

myElemAny :: Eq a => a -> [a] -> Bool
myElemAny _ []     = False
myElemAny t xs = any (== t) xs

-- 4
myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x] 

-- 5
squish :: [[a]] -> [a]
squish []     = []
squish (x:xs) = x ++ squish xs 

-- 6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs 

-- 7
squishAgain :: [[a]] -> [a]
squishAgain [] = []
squishAgain xs = squishMap (\x -> x) xs

-- 8
-- Does not work on empty lists.
myMaximumBy ::  (a -> a -> Ordering) -> [a] -> a   
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:y:ys)
  | f x y == GT = myMaximumBy f (x:ys)
  | otherwise   = myMaximumBy f (y:ys)

-- 9
-- Does not work on empty lists.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy f (x:y:ys)
  | f x y == LT = myMinimumBy f (x:ys)
  | otherwise   = myMinimumBy f (y:ys)

-- 10?
myMaximum :: (Ord a) => [a] -> a    
myMaximum xs = myMaximumBy compare xs 

myMinimum :: (Ord a) => [a] -> a
myMinimum xs = myMinimumBy compare xs
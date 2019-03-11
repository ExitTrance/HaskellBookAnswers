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



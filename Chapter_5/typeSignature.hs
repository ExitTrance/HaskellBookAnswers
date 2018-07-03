-- typeSignature.hs
module TypeSignature where


-- 1
functionH :: [a] -> a
functionH (x:_) = x

-- 2 Slightly wrong. To be comparable, they need to be the same type,
--   so (Ord a) => a -> a -> Bool is sufficient enough.
functionC :: (Ord a, Ord b) => a -> b -> Bool
functionC x y = if (x > y) then True else False

-- 3
functionS :: (a, b) -> b
functionS (x, y) = y
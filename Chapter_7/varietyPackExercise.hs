-- varietyPackExercise.hs
module VarietyPackExercise where


-- 1
--  a) k :: (a, b) -> a
--  b) k2 :: [Char]
--  c) k1 and k2 will return the number 3.
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)


-- 2
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))
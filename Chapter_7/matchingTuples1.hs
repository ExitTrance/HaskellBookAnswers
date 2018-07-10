-- matchingTuples1.hs
module MatchingTuples1 where

-- Pattern Matching example
addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y

-- Regular example using tuple functions fst and snd
addEmUp2Alt :: Num a => (a, a) -> a
addEmUp2Alt tup = (fst tup) + (snd tup)


-- fst implementation for a triple 
fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x


-- Third element in a triple 
third3 :: (a, b, c) -> c
third3 (_, _, x) = x
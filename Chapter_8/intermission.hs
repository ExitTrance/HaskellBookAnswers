-- intermission.hs
module Intermission where


applyTimes ::  (Eq a, Num a) => 
                a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b =  f (applyTimes (n-1) f b)

{- applyTimes 5 (+1) 5
    
   f (applyTimes 4 (+1) 6)
   f (applyTimes 3 (+1) 7)
   f (applyTimes 2 (+1) 8)
   f (applyTimes 1 (+1) 9)
   f (applyTimes 0 (+1) 10)
   10
-}

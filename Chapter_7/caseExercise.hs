-- caseExercise.hs
module CaseExercise where


functionC x y = 
  case greater of 
    True  -> x
    False -> y
  where greater = x > y

ifEvenAdd2 n = 
  case evenNumber of
    True  -> n + 2
    False -> n
  where evenNumber = even n 

-- 0 is neither positive nor negative.
nums x = 
  case compare x 0 of
    LT -> -1
    GT -> 1
    EQ -> 0
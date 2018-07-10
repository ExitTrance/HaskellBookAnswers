-- caseExpressions.hs
module CaseExpressions where

funcZ x = 
  case x + 1 == 1 of
    True  -> "Awesome"
    False -> "Wot"

pal xs = 
  case xs == reverse xs of
    True  -> "yes"
    False -> "no"

-- Same thing, but just with a where clause in case the y needs to be reused.
pal' xs = 
  case y of
    True  -> "yes"
    False -> "no"
  where y = xs == reverse xs
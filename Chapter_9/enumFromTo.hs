-- enumFromTo.hs
module EnumFromTo where


eftBool :: Bool -> Bool -> [Bool]
eftBool x y = eft x y

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd x y = eft x y

eftInt :: Int -> Int -> [Int]
eftInt x y = eft x y

eftChar :: Char -> Char -> [Char]
eftChar x y = eft x y


eft :: (Ord a, Enum a) => a -> a -> [a]
eft x y  
  | x > y  = []
  | x == y = [x]
  | x < y  = x : eft (succ x) y 
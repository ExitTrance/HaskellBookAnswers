-- chapterExercises.hs
module ChapterExercises where


---- 1
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

-- A
-- B Type stays the same.
tensDigit' :: Integral a => a -> a
tensDigit' x = d
  where (y, _)  = x `divMod` 10
        (_, d)  = y `divMod` 10
 
-- C
hunsD :: Integral a => a -> a
hunsD x = d
  where (y, _) = x `divMod` 100
        (_, d) = y `divMod` 100


---- 2
foldBool :: a -> a -> Bool -> a
foldBool x y z = 
  case z of
    True  -> x
    False -> y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y z
  | z         = x
  | otherwise = y


---- 3
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c) 

---- 4, 5, 6
-- roundTrip :: (Show a, Read a) => a -> a
-- roundTrip a = read (show a)
roundTrip :: (Show a, Read b) => a -> b
roundTrip = read . show

main = do 
  print (roundTrip 4 :: Int)
  print (id 4)
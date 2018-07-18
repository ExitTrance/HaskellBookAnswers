
multSum ::  (Integral a) => a -> a -> a
multSum num denom = go num denom 0 0 
  where go n d count sum
         | count == n = sum
         | otherwise = go n d (count + 1) (sum + d)
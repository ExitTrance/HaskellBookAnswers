{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 43

instance TooMany (Int, String) where
  tooMany (n, _) = n > 43

instance TooMany (Int, Int) where
  tooMany (n, m) = (n + m) > 43

instance (Num a, TooMany a) => TooMany(a, a) where
  tooMany (n, m) = tooMany (n + m)
  
newtype Goats = Goats Int deriving (Eq, Show, TooMany)




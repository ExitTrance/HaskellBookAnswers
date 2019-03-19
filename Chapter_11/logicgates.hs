{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 43

-- 1 --
-- using FlexibleInstances language pragma
--
-- instance TooMany (Int, String) where
--   tooMany (x, y) = x > 45

-- using newtype
newtype Goats = Goats (Int, String)
  deriving (Eq, Show)

instance TooMany Goats where
  tooMany (Goats (x, _)) = x > 43

-- 2 --
--instance TooMany (Int, Int) where
--  tooMany (x, y) = (x + y) > 43

-- 3 --
instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany(x + y)



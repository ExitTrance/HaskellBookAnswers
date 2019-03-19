{-# LANGUAGE GeneralizedNewtypeDeriving #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 43

newtype Goats = Goats Int deriving (Eq, Show, TooMany)


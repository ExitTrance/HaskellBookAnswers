-- myDataType.hs
module MyDataType where

-- Type and Data Constructor usually have the same name.
-- ' is used here to make it more obvious that they are in different
-- namespaces.
data Trivial = 
  Trivial' 
  deriving Show

instance Eq Trivial where
  Trivial' == Trivial' = True




data DayOfWeek = 
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving Show

data Date = 
  Date DayOfWeek Int
  deriving Show

-- Usage of :s -Wall is important here in case we make any mistakes.
-- If we left out the unconditional case for example,
-- the program would blow up at run time. With -Wall, we are notified
-- of possible warnings at compile time.
instance Eq DayOfWeek where
  (==) Mon  Mon   = True
  (==) Tue  Tue   = True
  (==) Weds Weds  = True
  (==) Thu  Thu   = True
  (==) Fri  Fri   = True
  (==) Sat  Sat   = True
  (==) Sun  Sun   = True
  (==) _ _        = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') = 
    weekday == weekday' && dayOfMonth == dayOfMonth'


data Identity a = 
  Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'
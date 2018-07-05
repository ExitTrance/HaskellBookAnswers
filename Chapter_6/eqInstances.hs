-- eqInstances.hs
module EqInstances where


data TisAnInteger =
  TisAn Integer
  deriving Show

instance Eq TisAnInteger where
  (==) (TisAn int) (TisAn int') = int == int'


data TwoIntegers = 
  Two Integer Integer
  deriving Show

instance Eq TwoIntegers where
  (==) (Two intOne intTwo) 
       (Two intOne' intTwo') = 
    intOne == intOne' && intTwo == intTwo'


data StringOrInt = 
    TisAnInt   Int
  | TisAString String
    deriving Show

instance Eq StringOrInt where
  (==) (TisAnInt int) 
       (TisAnInt int') = 
    int == int'
    
  (==) (TisAString string) 
       (TisAString string') = 
    string == string'


data Pair a = 
  Pair a a 
  deriving Show

instance Eq a => Eq (Pair a) where
  (==) (Pair vOne vTwo) 
       (Pair vOne' vTwo') = 
    vOne == vOne' && vTwo == vTwo'


data Tuple a b = 
  Tuple a b 
  deriving Show
    
instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple vOne vTwo)
       (Tuple vOne' vTwo') = 
    vOne == vOne' && vTwo == vTwo' 


data Which a = 
    ThisOne a
  | ThatOne a
    deriving Show
instance Eq a => Eq (Which a) where
  (==) (ThisOne v)(ThisOne v') = 
    v == v'
  (==) (ThatOne v)(ThatOne v') = 
    v == v'


data EitherOr a b = 
    Hello a
  | Goodbye b
    deriving Show

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello v) (Hello v') = 
    v == v'
  (==) (Goodbye v)(Goodbye v') = 
    v == v'
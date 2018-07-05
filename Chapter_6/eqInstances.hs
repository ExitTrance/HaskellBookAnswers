-- eqInstances.hs
module EqInstances where


data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn int) (TisAn int') = int == int'


data TwoIntegers = 
  Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two intOne intTwo) 
       (Two intOne' intTwo') = 
    intOne == intOne' && intTwo == intTwo'


data StringOrInt = 
    TisAnInt   Int
  | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt int) 
       (TisAnInt int') = 
    int == int'
    
  (==) (TisAString string) 
       (TisAString string') = 
    string == string'
    
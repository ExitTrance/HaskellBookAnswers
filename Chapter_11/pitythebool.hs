import Data.Int
-- 1
{-

  Bool | Bool  = ??
  Bool + Bool == ??
  2 + 2 = 4

  Cardinality of 4.

-}
data BigSmall =
    BigSmall Bool
  | Small    Bool
  deriving(Eq, Show)


-- 2
{-

  Int8 | Bool  = ??
  Int8 + Bool == ??
  256 + 2     == 258

  Cardinality of 258.

-}
data NumberOrBool =
    Numba     Int8
  | BoolyBool Bool
  deriving(Eq, Show)

myNumba = Numba (-128)


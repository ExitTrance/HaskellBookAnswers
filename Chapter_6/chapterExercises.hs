-- chapterExercises.hs
module ChapterExercises where
import Data.List
---- Does it typecheck?

-- 1
-- Does not typecheck as Person does not implement Show
-- Adding 'deriving Show' in the data declaration makes it typecheck
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)


-- 2
-- Does not typecheck as Mood does not implement Eq.
-- Add an instance of Eq to fix it in the data declaration.
data Mood = Blah 
          | Woot deriving (Show, Eq)

settleDown x = if x == Woot 
                then Blah
                else x

-- 3
  -- a Only Woot and Blah are acceptable inputs.
       
  -- b As the function checks for equality against the type Mood (specifically the value Woot here),
  --   the compiler will throw an error as it does not know how to handle equality checks against different types.

  -- c The compiler will throw an error as Ord has not been implemented in the form of an instance.


-- 4
-- Will typecheck. S1 is deceiving here, but it typechecks as it is a partial function application.
type Subject = String
type Verb = String
type Object = String

data Sentence = 
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


---- Given a datatype declaration, what can we do?

data Rocks = 
  Rocks String deriving (Eq, Show)

data Yeah = 
  Yeah Bool deriving (Eq, Show)

data Papu = 
  Papu Rocks Yeah
  deriving (Eq, Show)

-- 1 Does not typecheck.
--   phew = Papu "chases" True

-- 2 Typechecks.
truth = Papu (Rocks "chomskydoz") (Yeah True)

-- 3 Typechecks.
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- 4 Does not typecheck as it has no instance of Ord.
--   comparePapus :: Papu -> Papu -> Bool
--   comparePapus p p' = p > p'


---- Match the types

-- 1 Cannot be substituted. Because we can't make types more general. The most generic type we can use is Num here.
-- i :: a
-- i = 1

-- 2 Cannot be substituted as Fractional is more general than Num?
-- f :: Num a => a
-- f = 1.0

-- 3 Can be substituted as the compiler defaults to Fractional anyway.
-- f :: Fractional a => a
-- f = 1.0

-- 4 Can be substituted as RealFrac is a Fractional.
-- f :: RealFrac a => a
-- f = 1.0

-- 5 Can be substituted as Adding Ord to the identity function does nothing.
-- freud :: Ord a => a -> a
-- freud x = x

-- 6 Can be substituted. Just constrains the identity functions to Int.
-- freud' :: Int -> Int
-- freud' x = x

-- 7 Cannot be substituted, as actual type Int cannot be generalized.
-- myX = 1 :: Int
-- sigmund :: a -> a
-- sigmund x = myX

-- 8 Still cannot be substituted as actual type Int cannot be generalized to Num.
-- myX = 1 :: Int
-- sigmund' :: Num a => a -> a
-- sigmund' x = myX

-- 9 Can be substituted as Int has an instance of Ord, and sort only requires the variable to be bound to Ord.
-- jung :: [Int] -> Int
-- jung xs = head (sort xs)

-- 10 Can be substituted as the type signature is the default for this function.
-- young :: Ord a => [a] -> a
-- young xs = head (sort xs)

-- 11 Cannot be substituted, as the sort has been specified to '[Char]'. 'a' 
--    in signifier cannot be matched with '[Char] in sort'
-- mySort :: [Char] -> [Char]
-- mySort = sort
-- signifier :: Ord a => [a] -> a
-- signifier xs = head (mySort xs)
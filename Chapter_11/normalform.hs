-- Just confirmed that the type constructor (not the data constructor) of Fiction is passed
-- into the data constructor of BookType, 
-- data Fiction    = FictionData    deriving Show
-- data Nonfiction = NonfictionData deriving Show

data BookType = FictionBook    Fiction
              | NonfictionBook Nonfiction
              deriving Show

type AuthorName = String

data Author =
    Fiction    AuthorName
  | Nonfiction AuthorName
  deriving(Eq, Show)

 

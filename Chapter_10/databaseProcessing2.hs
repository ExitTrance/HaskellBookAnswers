import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate  UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
           (fromGregorian 1921 5 1)
           (secondsToDiffTime 34123))
  ]

-- 1
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate (DbDate x : xs) = x : filterDbDate xs
filterDbDate (_ : xs)        = filterDbDate xs
filterDbDate []              = []


-- 2
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr f [] where
  f (DbNumber x) y = x : y
  f _ y            = y

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = foldr (+) 0 . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb x =  (/) (fromIntegral $ sum list) (fromIntegral $ length list)
        where
          list = filterDbNumber x

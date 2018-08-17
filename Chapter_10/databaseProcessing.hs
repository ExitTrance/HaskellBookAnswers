-- databaseProcessing.hs
{-# language LambdaCase #-}

module DatabaseProcessing where

import Data.Time
import Data.Maybe

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)
  
theDatabase :: [DatabaseItem]
theDatabase =
  [   DbDate (UTCTime (fromGregorian 1911 5 1)(secondsToDiffTime 34123))
  ,   DbNumber 9001
  ,   DbNumber 9005
  ,   DbString "Hello, world!"
  ,   DbDate (UTCTime (fromGregorian 1921 5 1)(secondsToDiffTime 34123))
  ]

-- Using mapMaybe and LambdaCase
filterDbDate' :: [DatabaseItem] -> [UTCTime]
filterDbDate' = mapMaybe $ \case
  DbDate time -> Just time
  _ -> Nothing

-- Using list comprehension
filterDbDate2 :: [DatabaseItem] -> [UTCTime]
filterDbDate2 xs = [t | (DbDate t) <- xs ]

-- Using foldr
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr f [] where 
    f (DbDate x) y = x : y
    f _ y          = y


filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr f [] where
  f (DbNumber x) y = x : y
  f _ y            = y

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate 

sumDb :: [DatabaseItem] -> Integer
sumDb = foldr (+) 0 . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb xs = fromIntegral (sumDb xs) / fromIntegral(length . filterDbNumber $ xs)   
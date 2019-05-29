-- asPatterns.hs
import Data.Char

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf yy@(y:ys) xx@(x:xs)
  | y == x    = True && isSubsequenceOf ys xs
  | otherwise = isSubsequenceOf yy xs


-- Based on
-- https://github.com/evturn/haskellbook/blob/master/11/11.18-as-patterns.hs
capitalizeWords :: String -> [(String, String)]
capitalizeWords [] = []
capitalizeWords list = map f $ words list
  where
    f xx@(x:xs) = (xx, (toUpper x):xs)

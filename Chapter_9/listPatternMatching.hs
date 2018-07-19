-- listPatternMatching.hs
module ListPM where


myHead :: [a] -> Maybe a
myHead [ ]       = Nothing
myHead (x : _)   = Just x

data T = T String

--f :: T -> Int
f (T "123") = 0
f (T _) = 1     
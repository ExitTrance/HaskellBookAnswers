-- myFunctions.hs
module MyFunctions where

myString :: String    
myString = "Curry is awesome"

bang :: String -> IO ()
bang x = putStrLn (x ++ "!")

fourthchar :: String -> IO ()
fourthchar x = putStrLn y
  where y :: String 
        y = take 1 (drop 4 x)

-- Provide the amount of chars to be dropped in the second argument.
-- E.g.     dropChars "Curry is awesome!" 9
-- Result:  "awesome!"
dropChars :: String -> Int -> IO ()
dropChars x y = putStrLn z
  where z :: String
        z = drop y x
    
thirdChar :: String -> Char
thirdChar x = x !! 2

letterIndex :: Int -> Char
letterIndex x = myString !! x
    
rvrs :: String
rvrs = x ++ " " ++ y ++ " " ++ z ++ "."
  where
        x = drop 9 myString 
        y = take 2 (drop 6 myString)
        z = take 5 myString
    
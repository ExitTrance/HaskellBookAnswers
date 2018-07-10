-- greetIfCool3.hs
module GreetIfCool3 where


greetIfCool :: String -> IO ()
greetIfCool coolness = 
  case cool of
    True  -> putStrLn "eyyyyyyyyy. What's shakin'?"
    False -> putStrLn "pshhhhhhh."
  where cool = coolness == "downright frosty yo"
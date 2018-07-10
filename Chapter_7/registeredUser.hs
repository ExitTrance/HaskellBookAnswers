-- registeredUser.hs
module RegisteredUser where


newtype Username = Username String
newtype AccountNumber = AccountNumber Integer


data User = UnregisteredUser 
          | RegisteredUser Username AccountNumber


printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "Unregistered User"
printUser (RegisteredUser (Username name)
                          (AccountNumber acctNum)) 
          = putStrLn $ name ++ " " ++ show acctNum 

-- let name = Username "HansPeter"
-- let number = AccountNumber 72636363
-- printUser $ RegisteredUser name number
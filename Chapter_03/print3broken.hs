-- print3broken.hs
module Print3Broken where


printSecond :: IO ()
printSecond = do
  putStrLn greeting
  where greeting = "Yarrrrrrrrrr"

main :: IO ()
main = do
  putStrLn greeting
  printSecond
  where greeting = "Yarrrrrrrrrr"

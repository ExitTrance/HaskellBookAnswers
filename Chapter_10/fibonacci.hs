-- fibonacci.hs

module Fibonacci where

-- 1 & 2
fibs = takeWhile (\x -> x < 100)(take 20 (1 : scanl (+) 1 fibs))

-- 3
factorial = take 10 (scanl (*) 1 [1..])


    

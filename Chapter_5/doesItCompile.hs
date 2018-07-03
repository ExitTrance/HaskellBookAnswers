-- doesItCompile.hs
module DoesItCompile where

---- 1
-- The function bigNum does not have any input, therefore 
--   'wahoo = bigNum $ 10' fails

bigNum = (^) 5 $ 10
wahoo = bigNum -- $ 10



---- 2
-- Compiles just fine.
x = print
y = print "woohoo!"
z = x "hello world"

---- 3
-- Change c to 'c = a 10' so that it compiles and works.
a = (+)
b = 5
c = a 10
d = c 200


---- 4
-- c' is not a variable in scope.
-- Not able to fix it.
a' = 12 + b'
b' = 10000 * c'




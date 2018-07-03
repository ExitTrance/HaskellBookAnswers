-- polymorphism.hs

-- 1
f :: a -> a
f a = a

-- 2
g :: a -> a -> a
g a b = a -- or g a b = b

-- 3
h :: a -> b -> b
h a b = b

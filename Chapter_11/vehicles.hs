data Price = Price Integer deriving(Eq, Show)
data Manufacturer = Mini
                  | Mazda
                  | Tata
                  deriving(Eq, Show)

data Airline = PapuAir
             | CatapultR'Us
             | TakeYourChancesUnited
             deriving(Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline
             deriving(Eq, Show)

myCar    = Car Mini  (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata  (Price 7000)
doge     = Plane PapuAir

-- Q1 --
{- myCar :: Vehicle -}

-- Q2 --
isCar :: Vehicle -> Bool
isCar (Car _ _)   = True
isCar _           = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _         = False

areCars :: [Vehicle] -> Bool
areCars = foldr ((&&) . isCar) True


-- Q3 --
getManu :: Vehicle -> Manufacturer
getManu (Car manu _) = manu
getManu _            = undefined

-- Q4 --
{-
If we try to use the getManu function on plane,
it will simply crash, saying it is undefined.
This means that the function is not total.
-}

-- Q5 --
data Size = Size Integer deriving(Eq, Show)
data Vehicle' = Car' Manufacturer Price
              | Plane' Airline Size
              deriving(Eq, Show)

isPlane' :: Vehicle' -> Bool
isPlane' (Plane' _ _) = True
isPlane' _         = False

doge' = Plane' PapuAir (Size 12000)

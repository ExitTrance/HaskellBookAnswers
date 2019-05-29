# The Quad

```
data Quad =
    One
  | Two
  | Three
  | Four
  deriving (Eq, Show)
```

##### 1
```
eQuad :: Either Quad Quad
eQuad = 8
```

#### 2
```
prodQuad :: (Quad, Quad)
prodQuad = 16
```

##### 3 
```
funcQuad :: Quad -> Quad
funcquad = 256
```
##### 4 
```
prodTBool :: (Bool, Bool, Bool)
prodTBool = 8
```
##### 5 
```
gTwo :: Bool -> Bool -> Bool
gTwo = (2 ^ 2) ^ 2
```
##### 6 
```
fTwo :: Bool -> Quad -> Quad
fTwo = (4 ^ 4) ^ 2
fTwo = 65536
```


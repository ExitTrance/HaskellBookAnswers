# Understanding Folds

##### 1
`B & C`     

##### 2
`(((1 * 1) * 2) * 3)`

##### 3
`c`

##### 4
`a`

##### 5
```
a)  foldr (++) [] ["woot", "WOOT", "woot"]
b)  foldr max [] "fear is the little death"
c)  foldr (&&) True [False, True]
d)  foldr (||) True [False, True] -- Can only fail   if all of them are False.
e)  foldr ((++) . show) "" [1..5]
f)  foldl const 'a' [1..5]
g)  foldr const 0 "tacos"
h)  foldl (flip const) 0 "burritos"
i)  foldr (flip const) 'z' [1..5]
```



# Bottom Madness

## Will it blow up?

##### 1. [x^y | x <- [1..5], y <- [2, undefined]]
`Bottom.`

#####  2. take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
`Value.`

#####  3. sum [1, undefined, 3]
`Bottom.`

#####  4. length [1, 2, undefined]
`Value.`

#####  5. length $ [1, 2, 3] ++ undefined
`Bottom.`

#####  6. take 1 $ filter even [1, 2, 3, undefined]
`Value.`

#####  7. take 1 $ filter even [1, 3, undefined]
`Bottom.`

#####  8. take 1 $ filter odd [1, 3, undefined]
`Value.`

#####  9. take 2 $ filter odd [1, 3, undefined]
`Value.`

#####  10. take 3 $ filter odd [1, 3, undefined]
`Bottom.`


## Is it in normal form?

##### 1. [1, 2, 3, 4, 5]
`NF`

##### 2. 1 : 2 : 3 : 4 : _
`WHNF`

##### 3. enumFromTo 1 10
`Neither. Function Application.`

##### 4. length [1, 2, 3, 4, 5]
`Neither. Function Application.`

##### 5. sum (enumFromTo 1 10)
`Neither. Function Application.`

##### 6. ['a'..'m'] ++ ['n'..'z']
`Neither. Function Application.`

##### 7. (_, 'b')
`NF as it's fully evaluated.`
# Filtering

##### 1
`filter (\x -> rem x 3 == 0) [1..30]`

##### 2
`length . filter (\x -> rem x 3 == 0) $ [1..30]`

##### 3
`myFilter = filter (\x -> x /= "the" && x /= "a" && x /= "an") . words`

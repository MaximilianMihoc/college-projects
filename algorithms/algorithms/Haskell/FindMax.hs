findMax :: [Int] -> Int
findMax [x] = x
findMax (x : y : ys)
	|x >= y   = findMax(x:ys)
	|otherwise = findMax (y:ys)

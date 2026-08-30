min :: (Int,Int) -> Int
min (x,y)
	| x <= y	=x
	| otherwise =y
	
max :: (Int,Int) -> Int
max (x,y)
	| x <= y	=y
	| otherwise =x
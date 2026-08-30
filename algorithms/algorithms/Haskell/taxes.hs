r1 :: Float
r1 = 0.22
r2 :: Float 
r2 = 0.40
tfa :: Float
tfa = 175.0
limit :: Float
limit = 300.0

tax :: Float -> Float
tax x
	| x <= tfa 		=0
	| x <= limit 	=x * r1
	| otherwise 	=x * r2


gcd :: (int,int) -> int
gcd (x,0) = x
gcd (x,y) = gcd(y,x - y)



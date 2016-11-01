-- recursion de cola
factorial 0 = 1
factorial x = factorial (x-1) x where factorial x res | x==1 = res | x == 0 = res | otherwise = factorial (x-1) res*x

--recursion de pila
factorial2 0 = 1
factorial2 x = x * factorial (x-1)

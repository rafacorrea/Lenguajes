--ejercicio1
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)


--ejercicio2
palindromo =  maximum [y | y <-productos [100..999], isPalindrome y]

productos xs = [x * y | y<-xs, x<-xs]
isPalindrome n = if reverse temp == temp then True else False where temp = show n


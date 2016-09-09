--ejercicio1
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)

--recursion de cola
fibTail 1 = 1
fibTail 2 = 1
fibTail n = fib2 [1, 1] n
fib2 (h:t) n = if n > 3 then fib2 (t ++ [h + head(t)]) (n-1) else h + head(t)

--ejercicio2
palindromo =  maximum [y | y <-productos [100..999], isPalindrome y]

productos xs = [x * y | y<-xs, x<-xs]
isPalindrome n = if reverse temp == temp then True else False where temp = show n


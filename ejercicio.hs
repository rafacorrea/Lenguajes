fact 1 = 1
fact x = x * fact (x-1)

maximo [] = 0
maximo [x] = x
maximo(a:b:c) = let mayor(x, y) = if x > y then x else y in if c==[] then mayor(a,b) else maximo(mayor(a,b) : c)

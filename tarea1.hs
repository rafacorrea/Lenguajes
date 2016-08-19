maximo [] = 0
maximo [x] = x
maximo(a:b:c) = let mayor(x, y) = if x > y then x else y in if c==[] then mayor(a,b) else maximo(mayor(a,b) : c)

minimo [] = 0
minimo [x] = x
minimo (a:b:c) = let menor(x, y) = if x < y then x else y in if c==[] then menor(a,b) else minimo(menor(a,b) : c)

maxmin lista = (maximo lista, minimo lista)
maxminL (x : y) = if y /= [] then maxmin x : (maxminL y) else [maxmin x]

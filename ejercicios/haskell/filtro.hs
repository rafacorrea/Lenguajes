operacion _ [] re = re
operacion _ re [] = re
operacion f (hx:tx) (hy:ty) = [f hx hy] ++ (operacion f tx ty)

--operacion2 f lista = [y | y <- lista, f y]
operacion2 _ [] = []
operacion2 f (h:t) = if f h then [h] ++ (operacion2 f t) else operacion2 f t

--numero mas grande divisble entre X : operacion3 (rmod 4929) lista
operacion3 _ [] = 0
operacion3 f xs = if f numero then numero else operacion3 f (init xs) where numero = last xs

rmod x y = if y `mod` x == 0 then True else False

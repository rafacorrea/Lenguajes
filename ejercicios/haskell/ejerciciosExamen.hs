dividir 0 = dividir 1
dividir x = if lmod x lista then x else dividir (x+1) where lista = [1..18]

lmod numero (h:[]) = if numero `mod` h /= 0 then False else True
lmod numero (h:t) = if numero `mod` h /= 0 then False else lmod numero t

primo 0 = False
primo 1 = False
primo n = primo2 n 2
primo2 n x = if n `mod` x == 0 && x <= max then False else (if x<=max then primo2 n (x+1) else True) where max = (ceiling (fromIntegral (n) / 2))
--test = lista where lista = [1..10]

--operacion2 f lista = [y | y <- lista, y]

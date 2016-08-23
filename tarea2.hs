raiz x guess 0 = guess
raiz x guess n = (if n <= 1 then newguess else raiz x newguess (n-1)) where newguess = guess - ((guess*guess - x)/(2*guess))

quicky [] = []
quicky (x:xs) = let greaterPivot = quicky [a | a <- xs, a > x]
                    smallerPivot = quicky [a | a <- xs, a <= x]
in smallerPivot ++ [x] ++ greaterPivot

--insertion sort

insertionSort [] = []
insertionSort (h:[]) = [h]
insertionSort (h:t) = let insert num [] = [num]
                          insert num (h:t) = if num > h
                                             then [h] ++ (insert num t)
                                             else [num] ++ [h] ++ t
                      in
                          insert h (insertionSort t)

insertionSort2 [] = []
insertionSort2 (h:[]) = [h]                       
insertionSort2 (h:t) = let lc x lista = [y | y <- lista, x <= y] ++ [x] ++ [y | y<-lista, x > y]
                       in lc h (insertionSort2 t)

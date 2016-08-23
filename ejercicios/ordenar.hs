--insertion sort

insertionSort [] = []
insertionSort (h:[]) = [h]
insertionSort (h:t) = let insert num [] = [num]
                          insert num (h:t) = if num > h
                                             then [h] ++ (insert num t)
                                             else [num] ++ [h] ++ t
                      in
                          insert h (insertionSort t)

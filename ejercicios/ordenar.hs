ordena (x:y:z) = if x > y then [y] ++ ordena([x] ++ z) else ordena([y] ++ z)

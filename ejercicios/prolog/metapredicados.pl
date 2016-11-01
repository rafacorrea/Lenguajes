myMapList(_,[],[]).
myMapList(Goal, [H|T], [H2|T2]) :- Goal=..[Func|Params],
                                   append(Params, [H,H2], NewParams),
                                   Pred=..[Func|NewParams],
                                   call(Pred),
                                   myMapList(Goal, T, T2).
                                                          
                                                                     
succ(in, out) :- out is in + 1.

replace(X,Y,X,Y).
replace(_,_,Z,Z).

                                                          
  

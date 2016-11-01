isBucket(_,_,[]).
isBucket(Min, Max, [H|T]) :- H =< Max,
                             H >= Min,
                             isBucket(Min,Max,T).


bucketSort(_,_,[]).
bucketSort(isBucket(A, B, [H|R]), isBucket(C, D, List), [H|T]) :- H =< B,
                                                                  H >= A,
                                                                  bucketSort(isBucket(A, B, R),
                                                                             isBucket(C, D, List),
                                                                             T).
                                                                                   
bucketSort(isBucket(A, B, List), isBucket(C, D, [H|R]), [H|T]) :- H =< D,
                                                                  H >= C,
                                                                  bucketSort(isBucket(A, B, List),
                                                                             isBucket(C, D, R),
                                                                             T).

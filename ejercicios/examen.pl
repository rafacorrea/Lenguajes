%traducir(X, Y) :- trad(traduccion X, Y ).
%traduccion(gato, cat).

traduccion(gato,cat).
traduccion(this, este).
traduccion(is, es).
traduccion(an, un).
traduccion(example, ejemplo).
traduccion(de, of).
traduccion(como, how).
traduccion(funciona, works).
traduccion(my, mi).
traduccion(program, programa).
traduccion(X,Y) :- traduccion(Y,X).

traducir([],[]).
traducir([H|T], [H2|T2]) :-
    traduccion(H, H2),
    traducir(T,T2).
    

fibonacci(_,_,0,_).
fibonacci(X, Y, N, [X|T]):-
    N1 is N-1,
    Res is X+Y,
    fibonacci(Y, Res, N1, T).

suma([], 0).
suma([H|T], Res) :- par(H),
                    nonvar(Res),
                    suma(T, R),
                    Res is H + R.
                    

suma([H|T], Res) :- par(H),
                    var(Res),
                    suma(T, R),
                    Res is H.
                    
                    
suma([H|T], Res) :- suma(T, Res).                    

par(X) :- 0 is mod(X,2).
    
    

  


  

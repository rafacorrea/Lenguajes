%DICCIONARIO
traduccion(this, este).
traduccion(is, es).
traduccion(an, un).
traduccion(example, ejemplo).
traduccion(de, of).
traduccion(como, how).
traduccion(funciona, works).
traduccion(my, mi).
traduccion(program, programa).
%traduccion(X,Y) :- traduccion(Y,X).

espanol(este).
espanol(es).
espanol(un).
espanol(ejemplo).
espanol(mi).
espanol(programa).

ingles(of).
ingles(how).
ingles(works).

%PARA EL NUMERO 1, traducir([this, is, an, example, de, como, funciona, my, program],X,Y).
traducir([],[],[]).
traducir([H|T], [H2|T2], Lista) :-
    traduccion(H, H2),
    espanol(H2),
    traducir(T,T2, Lista).

traducir([H|T], Lista, [H2|T2]) :-
    traduccion(H, H2),
    ingles(H2),
    traducir(T,Lista, T2).                                                       
             
             
fibonacci(0,0).
fibonacci(1, [1]).                      
fibonacci(N, X) :- fibonacci(1,1,N-1, X).
fibonacci(X,Y,0,[X]).
fibonacci(X, Y, N, [X|T]):-
    N1 is N-1,
    Res is X+Y,
    fibonacci(Y, Res, N1, T).                

par(X) :- 0 is mod(X,2).

sum(L,R) :-
    sum(L,0,R).

sum([],F,F).
sum([H|T],F,R) :-
    par(H),
    F2 is F+H,
    sum(T,F2,R).

sum([H|T],F,R) :- sum(T,F,R).
  

%PARA EL NUMERO 2, N => cuantos numeros
fibsuma(N, Y) :- fibonacci(N, X),
                 sum(X, Y).

  

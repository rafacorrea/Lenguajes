dlength([], 0).
dlength([_|T], Size) :- dlength(T,S), Size is S+1.

isLast([H|[]], H).
isLast([_|T], S) :- isLast(T,S).

myAppend(X,[],[X]).
myAppend(X,[H|T], [H|R]) :- myAppend(X,T,R).

myAppend2(X, Lista, [X|Lista]).

myDelete(X,[],[]).
myDelete(X, [H|T], T) :- myDelete(X,T,R).
myDelete(X, [H|T], [H|T2]) :- H \= X, myDelete(X,[H|T], T2).
%(myDelete(X,T,[H|R]) :- H \= X)

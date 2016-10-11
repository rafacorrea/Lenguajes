% quesque ariel dice que vienen en la biblia
% base de conocimientos
father(terach, nachor).
father(terach, haran).
father(terach, abraham).
father(haren, lot).
father(haren, mismcah).
father(haren, yiscah).
father(abraham, isaac).
father(tareh, sarah).
mother(sarah, isaac).
male(terach).
male(haran).
male(abraham).
male(nachor).
male(lot).
male(isaac).
female(sarah).
female(mismcah).
female(yiscah).
% porque católicos jajaja
% consultas simples
% male(abraham) - True
% male(X) - con barra espaciadora regresa todos los True
%           con enter regresa unicamente el primero

% consulta mamona
% mother(sarah, _),female(sarah).
% la coma es un hermoso &&
% father(X,Y),male(Y) - regresa los padres y los hijos de los hijos hombres

% esto es una regla
son(X,Y) :- father(Y,X),male(X).
son(X,Y) :- mother(Y,X),male(X).
% si corremos son(X, haren). regresa a lot

grandFather(X,Y) :- father(X,Z),father(Z,Y).
grandFather(X,Y) :- father(X,Z),mother(Z,Y).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

grandParent(X,Y) :- parent(X,Z),parent(Z,Y).

brother(X,Y) :- parent(Z,X),parent(Z,Y), male(Y), X\=Y.

% Recursion en reglas porque yolo
ancestor(X,Y) :- parent(X,Y). %caso base
ancestor(X,Y) :- parent(X,Z),ancestor(Z,Y). %paso recursivo

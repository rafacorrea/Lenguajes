%inserta un numero al arbol y checa si necesita rotar, falta una rotacion al arbol original que se hace en insertF.
insert(Num, empty, tree(Num,empty,empty)) :- !.
insert(Num, tree(Element,Left,Right), tree(Element, Left3, Right)) :- Num < Element,
                                                                      insert(Num, Left, Left2),
                                                                      rotate(Left2, Left3).

insert(Num, tree(Element,Left,Right), tree(Element, Left, Right3)) :- Num >= Element,
                                                                      insert(Num, Right, Right2),
                                                                      rotate(Right2,Right3).
%inserta un numero y checa si necesita rotar el arbol. insertF(5, empty, X).

insertF(Num, Tree, Tree2) :- insert(Num, Tree, Temp),
                             rotate(Temp, Tree2).


%inserta una lista al arbol especificado: arbol([1,5,2,10,9], empty, X).
arbol([H], I, R)   :- insertF(H,I,R).
arbol([H|T], I, R) :- insertF(H, I, S),
                      arbol(T, S, R).

%rotacion a la derecha en el arbol especificado.
rotateR(tree(Root, Left, Right), tree(NewRoot, NewLeft, tree(Root, R, Right))) :- getRoot(Left, NewRoot),
                                                                                  getLeft(Left, NewLeft),
                                                                                  getRight(Left, R).

%rotacion a la izq.
rotateL(tree(Root, Left, Right), tree(NewRoot, tree(Root, Left, R), NewRight)) :- getRoot(Right, NewRoot),
                                                                                  getRight(Right, NewRight),
                                                                                  getLeft(Right, R).
%doble rotacion a la izq.

rotateLR(tree(Root,Left,Right), Res) :- rotateL(Left,Temp),
                                        rotateR(tree(Root,Temp,Right), Res).

%doble rotacion a la der.
rotateRL(tree(Root,Left,Right), Res) :- rotateR(Right,Temp),
                                        rotateL(tree(Root,Left,Temp), Res).


%getRoot regresa un numero, getRight y getLeft busca el arbol der e izq del arbol que se le pase.
getRight(tree(_,_,Right), Right).
getLeft(tree(_,Left,_), Left).
getRoot(tree(Root, _, _), Root).

%consigue el maximo de un arbol, regresa un arbol. getMax(tree(5,tree(1,empty,empty), tree(7,empty,empty)), X) regresara tree(7,empty,empty)
getMax(empty, empty) :- !.
getMax(tree(Root, Left, empty), tree(Root, Left, empty)).
getMax(tree(_,_,tree(A,B,C)), Res) :- getMax(tree(A,B,C), Res).

%Regresa el arbol, reemplazando el nodo a borrar con su arbol izq.
deleteTree(Num,tree(Root, Left, empty), Left) :- Num = Root.


deleteTree(Num, tree(Root, Left, Right), tree(Root, Res, Right)) :- Num < Root,
                                                                    deleteTree(Num, Left, Res).

deleteTree(Num, tree(Root, Left, Right), tree(Root, Left, Res)) :- Num >= Root,
                                                                   deleteTree(Num, Right, Res).


%Encuentra el numero mayor del arbol izq, cambia el valor de la raiz por ese valor y mueve el arbol izq del nodo borrado donde estaba el nodo borrado.
deleteNode(tree(_, Left, Right), Right) :- getMax(Left, empty).

deleteNode(tree(Root, Left, Right), tree(Num,NewLeft,NewRight)) :- getMax(Left, tree(Num, _, empty)),
                                                                   deleteTree(Num, tree(Root, Left, Right), tree(_, NewLeft, NewRight)).


%Busca el numero, lo quita y mueve los hijos de ese nodo, vuelve a rebalancear los arboles en el camino al nodo eliminado.
deleteF(Num, tree(Root, Left,Right), Res) :- Num = Root,
                                             deleteNode(tree(Root,Left,Right), Tree2),
                                             rotate(Tree2, Res), !.

deleteF(Num, tree(Root, Left, Right), Res) :- Num < Root, %buscando el numero...
                                              deleteF(Num, Left, Left2),
                                              rotate(tree(Root, Left2, Right), Res), !.

deleteF(Num, tree(Root, Left, Right), Res) :- Num >= Root, %buscando el numero...
                                              deleteF(Num, Right, Right2),
                                              rotate(tree(Root, Left, Right2), Res).
%calcula la altura del arbol.
height(tree(_,empty,empty), 1) :- !.
height(empty, 0) :- !.
height(tree(_, Left, Right), Num) :- height(Left, LeftN),
                                        height(Right, RightN),
                                        max_list([LeftN, RightN], Temp),
                                        Num is Temp+1.

%calcula el factor de balance de un arbol, utilizando la funcion de height.
balanceFactor(tree(_, Left,Right), Num) :- height(Left, X),
                                              height(Right,Y),
                                              Num is Y - X.


%revisa si el arbol se tiene que rotar, y de que manera.
rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R >= 2,
                                         balanceFactor(Right, X),
                                         X =< -1,
                                         rotateRL(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree), !.

rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R >= 2,
                                         rotateL(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree), !.

rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R =< -2,
                                         balanceFactor(Left, X),
                                         X >= 1,
                                         rotateLR(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree), !.

rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R =< -2,
                                         rotateR(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree), !.

%si el factor ed balance no es >=2 o <= -2 entonces no hay nada que hacer...
rotate(Tree, Tree).


/* inorden(tree(6,tree(3,empty,empty),tree(9,tree(7, empty, empty),tree(11, empty, empty))), R).    */
inorden(empty, _).
inorden(tree(Root, Left, Right), R) :-
	inorden(Left,Li),
	inorden(Right,Ld),
	append(Li,[Root|Ld],R).




%tree(3,tree(2,tree(1,empty,empty),empty),empty)
%tree(9,tree(7,tree(6,empty,empty),tree(8,empty,empty)),tree(10,empty,empty))
%tree(3,tree(2,tree(1, empty,empty), empty), tree(5, tree(4,empty,empty), tree(7,empty,empty)))
%tree(6,tree(3,tree(2,empty,empty), tree(5,tree(4,empty,empty), empty)), tree(8,tree(7,empty,empty), tree(9,empty,empty)))

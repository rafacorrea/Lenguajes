insert(Num, empty, tree(Num,empty,empty)).
insert(Num, tree(Element,Left,Right), tree(Element, Left2, Right)) :- Num < Element,
                                                                      insert(Num, Left, Left2).
insert(Num, tree(Element,Left,Right), tree(Element, Left, Right2)) :- Num >= Element,
                                                                      insert(Num, Right, Right2).
                                                                                                                                                                                             

arbol([H], I, R)   :- insert(H,I,R).                                              
arbol([H|T], I, R) :- insert(H, I, S),
                      arbol(T, S, R).     

rotateR(tree(Root, Left, Right), tree(NewRoot, NewLeft, tree(Root, R, Right))) :- getRoot(Left, NewRoot),
                                                                      getLeft(Left, NewLeft),
                                                                      getRight(Left, R).

rotateL(tree(Root, Left, Right), tree(NewRoot, tree(Root, Left, R), NewRight)) :- getRoot(Right, NewRoot),
                                                                      getRight(Right, NewRight),
                                                                      getLeft(Right, R).
                                                                                                                                 


getRight(tree(_,_,Right), Right).                          
getLeft(tree(_,Left,_), Left).
getRoot(tree(Root, _, _), Root).

deleteNode(tree(Root, Left, Right), left, tree(Root,empty,Right)).
deleteNode(tree(Root, Left, Right), right, tree(Root,Left,empty)).

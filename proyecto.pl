insert(Num, empty, tree(Num,empty,empty)).
insert(Num, tree(Element,Left,Right), tree(Element, Left3, Right)) :- Num < Element,
                                                                      insert(Num, Left, Left2),
                                                                      rotate(Left2, Left3).
                                                                      
insert(Num, tree(Element,Left,Right), tree(Element, Left, Right3)) :- Num >= Element,
                                                                      insert(Num, Right, Right2),
                                                                      rotate(Right2,Right3).
                                                                                                                                                                                             
insertF(Num, Tree, Tree2) :- insert(Num, Tree, Temp),
                             rotate(Temp, Tree2).

arbol([H], I, R)   :- insertF(H,I,R).                                              
arbol([H|T], I, R) :- insertF(H, I, S),
                      arbol(T, S, R).     

rotateR(tree(Root, Left, Right), tree(NewRoot, NewLeft, tree(Root, R, Right))) :- getRoot(Left, NewRoot),
                                                                      getLeft(Left, NewLeft),
                                                                      getRight(Left, R).

rotateL(tree(Root, Left, Right), tree(NewRoot, tree(Root, Left, R), NewRight)) :- getRoot(Right, NewRoot),
                                                                      getRight(Right, NewRight),
                                                                      getLeft(Right, R).
                                                                                                                                 
rotateLR(tree(Root,Left,Right), Res) :- rotateL(Left,Temp),
                                        rotateR(tree(Root,Temp,Right), Res).
                                        
rotateRL(tree(Root,Left,Right), Res) :- rotateR(Right,Temp),
                                        rotateL(tree(Root,Left,Temp), Res).                                        
                                                                    

getRight(tree(_,_,Right), Right).                          
getLeft(tree(_,Left,_), Left).
getRoot(tree(Root, _, _), Root).

deleteNode(tree(Root, Left, Right), left, tree(Root,empty,Right)).
deleteNode(tree(Root, Left, Right), right, tree(Root,Left,empty)).

height(tree(_,empty,empty), 1).
height(empty, 0).
height(tree(Root, Left, Right), Num) :- height(Left, LeftN),
                                        height(Right, RightN),
                                        max_list([LeftN, RightN], Temp),
                                        Num is Temp+1.
                                         
balanceFactor(tree(Root, Left,Right), Num) :- height(Left, X),
                                              height(Right,Y),
                                              Num is Y - X.


rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R >= 2,
                                         balanceFactor(Right, X),
                                         X =< -2,
                                         rotateLR(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree).

rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R >= 2,
                                         rotateL(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree).

rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R =< -2,
                                         balanceFactor(Left, X),
                                         X >= 2,
                                         rotateRL(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree).
                                                  
rotate(tree(Root, Left, Right), Tree) :- balanceFactor(tree(Root,Left,Right), R),
                                         R =< -2,
                                         rotateR(tree(Root,Left,Right), Temp),
                                         rotate(Temp, Tree).    
                                                  
rotate(Tree, Tree).
                                                             
%tree(3,tree(2,tree(1,empty,empty),empty),empty)   
%tree(9,tree(7,tree(6,empty,empty),tree(8,empty,empty)),tree(10,empty,empty))

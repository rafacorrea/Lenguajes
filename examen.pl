insert(Num, empty, tree(Num, empty,empty)).
insert(Num, tree(Root, empty, empty), tree(NewRoot, tree(X, empty, empty), empty)) :- (Num > Root -> 
                                                                                          NewRoot is Num,
                                                                                          X is Root
                                                                                      ; 
                                                                                          X is Num, NewRoot is Root
                                                                                      ),!.
                                                                                                                                                         
insert(Num, tree(Root, Left, empty), tree(NewRoot, Left, tree(X, empty, empty))) :- (Num > Root -> 
                                                                                        NewRoot is Num,
                                                                                        X is Root
                                                                                    ;
                                                                                        X is Num, NewRoot is Root
                                                                                    ),!.    

%izq cuando num>root
insert(Num, tree(Root, Left, Right), tree(NewRoot, NewLeft2, Right)) :- insert(Num, Left, NewLeft),
                                                                        balanceFactor(tree(Root, NewLeft, Right), Balance),
                                                                        Balance < 2,
                                                                        check(Right),
                                                                        Num > Root,
                                                                        NewRoot is Num,
                                                                        cambiarRaiz(Root, NewLeft, NewLeft2), !.

%izq cuando !num>root                                                                        
insert(Num, tree(Root, Left, Right), tree(NewRoot, NewLeft2, Right)) :- insert(Num, Left, NewLeft),
                                                                        balanceFactor(tree(Root, NewLeft, Right), Balance),
                                                                        Balance < 2,
                                                                        check(Right),
                                                                        insert(Num, Left, NewLeft2),!,
                                                                        NewRoot is Root.
 
%der cuando num>root                                                                 
insert(Num, tree(Root, Left, Right), tree(NewRoot, Left, NewRight2)) :- insert(Num, Right, NewRight),
                                                                        Num > Root,
                                                                        NewRoot is Num,
                                                                        cambiarRaiz(Root, NewRight, NewRight2), !.
%der cuando !num>root
insert(Num, tree(Root, Left, Right), tree(NewRoot, Left, NewRight2)) :- insert(Num, Right, NewRight),
                                                                        insert(Num, Right, NewRight2),
                                                                        NewRoot is Root.
                                                                                                                           

                                                                                    
cambiarRaiz(Num, tree(Root, Left, Right), tree(Num, Left, Right) ).  
                                                                     
check(tree(Root, empty, empty)).
check(tree(Root, Left, Right)) :- check(Left),
                                  check(Right),
                                  height(Left, X),
                                  height(Right, Y),
                                  X = Y.                                              
                                                                       
                                                                      
arbol([H], I, R) :- insert(H, I, R).
arbol([H|T], I, R) :- insert(H, I, S),
                        arbol(T, S, R).

height(tree(_,empty,empty), 1) :- !.
height(empty, 0) :- !.
height(tree(_, Left, Right), Num) :- height(Left, LeftN),
                                        height(Right, RightN),
                                        max_list([LeftN, RightN], Temp),
                                        Num is Temp+1.
                                                                             
balanceFactor(tree(Root, Left, Right), Z) :- height(Left, X),
                                             height(Right, Y),
                                             Z is X - Y.

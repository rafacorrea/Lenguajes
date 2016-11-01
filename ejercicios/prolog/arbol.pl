insert(Num, empty, tree(Num,empty,empty)).
insert(Num, tree(Element,Left,Right), tree(Element, Left2, Right)) :- Num < Element,
                                                                      insert(Num, Left, Left2).
insert(Num, tree(Element,Left,Right), tree(Element, Left, Right2)) :- Num > Element,
                                                                      insert(Num, Right, Right2).


El proyecto se basa en la creación de un árbol AVL en el que se permite

Insertar 1 elemento - Insertar una lista de elementos - Borrar un elemento - Recorrido Inorden

El árbol AVL utilizado para los ejemplos es el siguiente:

=======     tree(6, tree(3, empty, empty), tree(9, tree(7, empty, empty), tree(11, empty, empty)))	=======

   	 6
        / \
       /   \
      /     \
     3       9
            / \
      	   7   11
 


*Para generar el árbol de arriba insertando una lista de elementos es:
	arbol([3,6,7,9,11] , empty, R).
	R = tree(6, tree(3, empty, empty), tree(9, tree(7, empty, empty), tree(11, empty, empty)))


*Insertar 1 elemento: vamos a insertar el número 8
	insertF(8, tree(6,tree(3,empty,empty),tree(9,tree(7, empty, empty),tree(11, empty, empty))), R).
	R = tree(7, tree(6, tree(3, empty, empty), empty), tree(9, tree(8, empty, empty), tree(11, empty, empty))) .


*Insertar la lista [8, 1, 2] al árbol.
	arbol([8, 1, 2] , tree(6,tree(3,empty,empty),tree(9,tree(7, empty, empty),tree(11, empty, empty))), R).
	R = tree(7, tree(3, tree(1, empty, tree(2, empty, empty)), tree(6, empty, empty)), tree(9, tree(8, empty, empty), tree(11, empty, empty))) .


*Eliminar un elemento: eliminaremos el número 
	deleteF(6, tree(6, tree(3, empty, empty), tree(9, tree(7, empty, empty), tree(11, empty, empty))), R).
	R = tree(9, tree(3, empty, tree(7, empty, empty)), tree(11, empty, empty))


*Para el recorrido inorden:
	inorden(tree(6,tree(3,empty,empty),tree(9,tree(7, empty, empty),tree(11, empty, empty))), R). 
	R = [3, 6, 7, 9, 11|_G1724] .
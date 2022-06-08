Sobre implementar funcionalidad
Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una? ¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo? Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?


Sobre implementar funcionalidad
¿esos tests pasaron (los tres) de una? No, no pasaron los 3 test al mismo tiempo, fuimos implementando lo unicamente lo pedido para que pase cada uno de los tests.
¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? Esto fue lo que hicimos.
¿qué pensas de implementar esa funcionalidad de esa forma? Nos parecio la manera mas natural y ordenada de para desarrollar codigo.


Sobre código repetido
¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

Sobre código repetido
¿les quedó código repetido? ¿dónde? Si, cremos que nos quedaron algunos metodos que son similares entre si en la objeto habitat.
Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? Creemos que hay que hay cierto comportamiento que le asignamos al habitat que podria haber sido parte del comportamiento de las avispas o de el nido de las avispas el cual no puede haber faltado modelar.
¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? En nuestro caso, el responsable es el habitat
¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos? Tiene sentido que sea el habitat ya que en la naturaleza es la avispa la que tenga que ir al habitat para buscar orugas/polillas y va a ser el habitat quien las tenga


Sobre código repetido 2
Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Sobre código repetido 2
Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? Podriamos haber hecho que cada tipo de avispa sea responsable de saber que cantidad de huevos hay de su tipo y declarar un unico metodo cantidadDeHuevos en avispaOriana el cual sus hijos heredarian para eliminar los metodos similares
¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? Utilizamos una sola coleccion para guardar los huevos, utilizamos constantes con los nombres de las avispas las cuales modelan los nidos y tienen como valor su posicion dentro de la coleccion
¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba? A nosotros nos resulto mas sencillo y ordenado utilizar una coleccion aunque tambien consideramos la posibilidad de utilizar solamente colaboradores para guardar la cantidad de cada uno de los distintos tipos de huevos aunque de esta forma el habitat quedaba con una cantidad muy grande de colaboradores.

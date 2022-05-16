# Stack

## Primera parte 

El objetivo de la primera parte es seguir ejercitando reemplazar if por polimorfismo, en particular implementando un Stack.

Hay que hacer pasar todos los tests del ejercicio y la implementación del Stack no debe tener if. No se pueden modificar los tests.

Ayudas: 

1. Primero hagan pasar todos los tests usando if y después aplique la técnica para sacar if que vimos. 
2. Si les sirve, utilicen una metáfora. Una muy útil es la de representar el juego de los bebés donde se apilan platos en una especie de torre de Hanoi.
Importante: Tampoco se puede usar handleo de excepciones para ocultar lo que sería en definitiva un if.

## Segunda parte

El stack de la primera parte es utilizado para almacenar oraciones de cualquier longitud. Se debe implementar el mensaje find de SentenceFinderByPrefix que dado un prefijo se encarga de devolver todas las oraciones almacenadas en el Stack que contengan dicho prefijo. Por ej. si el prefijo es "Wint", y las oraciones en el Stack son "winter is coming", "winning is everything", "The winds of Winter" y "Winter is here" sólo debería devolver la última. 

El prefijo es case-sensitive, no puede ser vacío, ni contener espacios vacíos y el stack al terminar la operación de búsqueda debe de mantener las mismas oraciones en idéntico orden. 

Además de implementar "find", se debe testear dicha funcionalidad. Para ello escriba todos los tests que crea necesario en SentenceFinderByPrefixTest.

Aclaración: No se pueden agregar mensajes adicionales a Stack.

## Extra

Se pide extender el modelo para que además de representar al stack ilimitado ya construido, se puedan construir instancias de un stack limitado. Es decir, uno de que tenga una cantidad limitada de celdas y que no se puedan pushear más elementos que los disponibles en su capacidad.

NOTA: Hemos incluido una implementación del extra en Stack-Extra.st, no lo hemos mergeado con el original porque no veíamos necesario arreglar los conflictos generados.

Se pide además analizar cuál de los modelos anteriores cree que es más sencillo extender para representarla y hacerlo. 

No hemos implementado el modelo de las Torres de Babel. Hemos utilizado una abstracción de la idea de "estado de la pila": Originalmente, para el stack infinito de la parte 1, habían dos estados: vacío y no vacío. Con la llegada de la pila finita, lo más intuitivo fue añadir un colaborador interno al stack llamado 'capacidad', que almacene la cantidad máxima de elementos, y que en el caso de una pila infita tenga valor infinito (implementado ya por Smalltalk). Ya con ese colaborador, es muy simple extender la funcionalidad añadiendo un tercer estado "lleno" que se active cuando la cantidad de elementos de la pila sea igual a la capacidad, condición imposible en una pila infinita. 
Así que al menos la implementación que pensamos mediante la abstracción de los estados y un switch dinámico entre ellos fue muy simple de extender al caso finito.

Además se deberán agregar los casos de tests que hagan falta para probar el nuevo tipo de stack.

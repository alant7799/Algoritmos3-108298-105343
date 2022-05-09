# Números

## Primera parte

Hacer file-in del archivo Numeros-Parte1-Ejercicio.st.

Como se observa, contamos con una clase Numero que representa un modelo de números. En particular soporta operaciones de enteros y de fracciones.
Contamos con una suite de tests que verifica una serie de operaciones básicas que soporta nuestro modelo.

El objetivo de esta primera parte es quitar los ifs utilizando polimorfismo, aplicando el algoritmo que vimos en clase. 

Los tests deben seguir pasando (sin modificarlos).

## Segunda parte

Para esta segunda parte, deben previamente quitar la categoría Numeros-Parte1-Ejercicio, y luego hacer file-in de Numeros-Parte2-Ejercicio.st.

Este segundo modelo presentado es una posible solución de la primera parte, pero agregando nuevas operaciones: resta, división y fibonacci.

Como podrán ver cuando corran los tests, hay varios que funcionan y son los correspondientes a cuando se opera aritméticamente entre números del mismo tipo, o sea entre enteros o entre fracciones. Los test que fallan son los relacionados a las operaciones entre números de distinto tipo, es decir, entre enteros y fracciones y viceversa.

El objetivo de este ejercicio es que implementen la suma, la resta, la multiplicación y la división entre números enteros y fraccionarios.

La solución final no debe tener if en los métodos que deben implementar y todos los test deben funcionar (sin ser modificados!).

**Pasos a seguir:**

1. Antes de empezar a resolver el problema, debuggeen los tests que funcionan para entender cómo es el modelo que se está presentando. Analicen las clases Numero, Entero y Fraccion.
2. Una vez que se sientan cómodos con el modelo, hagan pasar todos los tests implementando lo necesario utilizando ifs. 
3. Una vez que los tests pasen, apliquen el algoritmo que vimos en clase para reemplazar if por polimorfismo.

Para la entrega, deben hacer file-out de la solución a esta segunda parte. No es necesario entregar la solución a la primera parte.

**Algunas aclaraciones:**

- Las fracciones no pueden tener denominador 1. Fracciones con denominador 1 se asumen enteros.
- Los enteros no pueden responder los mensajes #numerador y #denominador ya que no son fracciones.
- Cuando se opera aritméticamente con enteros, verán que se utilizan las operaciones aritméticas provistas por el sistema. Esto es para que sea más performante.

-------------------------------------------------_-------------------------------------------------

## Desafío Adicional (opcional, no resta, sólo otorga puntos extra)

Aquellos que estén interesados en llevar al extremo el reemplazo de if pr polimorfismo (y practicar para el parcial), traten de sacar los ifs que ya venían en el ejercicio inicialmente: Los tienen que ver con que no se puede dividir por cero, que el denominador no puede ser uno, casos bases de fibonacci, etc. 

Las soluciones a este desafío son muy interesantes y distintas para lenguajes de prototipación (ej. javascript) vs clasificación.


## Preguntas teóricas

### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?.


-En un double dispatch, un tipo de método en el que tanto el colaborador como el receptor del mensaje son polimórficos, tenemos un primer llamado que nos da el tipo del receptor, y luego otro llamado que nos da el tipo del colaborador utilizado.

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos polimorfismo?

-Porque, más allá de que respondan un mismo mensaje, el mecanismo interno de funcionamiento de dicho método puede ser diferente.

### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

- Instanciamos los objetos mediante las subclases de las clases abstractas, pues nosotros no queremos crear una instancia de una "idea", como puede ser la idea de número, si no que queremos un entero, o una fracción particular. En caso de que se cree desde diferentes lugares o de diferentes formas, lo resolveríamos mediante más subclasificaciones apropiadas.

### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

- Los agrupamos también mediante subclasificación, ordenando a los métodos mediante un concepto que los englobe, como es el caso de la suma, resta, multiplicación y división siendo englobadas por el concepto de operación aritmética.

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

- La idea de "self subclassResponsibility" es delegar la responsabilidad del método a la subclase correspondiente a la clase abstracta original, pues a pesar de que todos los números respondan al mensaje de "sumar", una fracción y un entero suman de forma diferente, en el ejemplo de lo que acabamos de terminar.

### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?
- El encapsulamiento nos ayuda a desacoplar las diferentes entidades que modelamos de nuestra realidad para poder tratarlas propiamente como entes diferentes, y de esa forma cuando nos preocupamos, por ejemplo, por un "entero", solo nos tenemos que preocupar por el entero, o, en el ejemplo de los tests del primer ejercicio, en los test solo nos preocupamos por los tests y no por las dinámicas internas de las avispas.
Como menciona Daniel Ingalls en el paper "Design Principles Behind Smalltalk": "Ninguna componente en un sistema complejo debería depender de la implementación interna de otro componente". No se nos ocurre una mejor frase para explicar la importancia del encapsulamiento.


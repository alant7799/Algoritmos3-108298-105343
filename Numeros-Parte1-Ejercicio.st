!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:32'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:10'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:43'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:11'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:28'!
test10AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:42'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:04:04'!
test14NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:05:06'!
test15NegationOfFraccionIsCorrect

	self assert: (Numero with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/8/2019 21:09:34'!
setUp

	zero := Numero with: 0.
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:29:20'!
* aMultiplier 

	^self subclassResponsibility.
	
	"self error: 'Tipo de número no soportado'"! !

!Numero methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:29:01'!
+ anAdder 

	^self subclassResponsibility.
	
	"self error: 'Tipo de número no soportado'"
	
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:42:08'!
negated
	^self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:47:06'!
isNegative
	^self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:49:51'!
isOne
	^self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:50:43'!
isZero	^self subclassResponsibility.! !


!Numero methodsFor: 'initialization' stamp: 'NR 9/8/2019 20:40:14'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'IACS 5/4/2022 21:49:34'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	
	numerator := aNumerator.
	
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'IACS 5/4/2022 21:51:04'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'IACS 5/4/2022 21:59:51'!
printOn: aStream
	^self subclassResponsibility.! !


!Numero methodsFor: 'comparing' stamp: 'NR 9/8/2019 21:50:26'!
= anObject

	^(anObject isKindOf: self class) and: [ type = anObject type and: 
		[ type = #Entero ifTrue: [ value = anObject integerValue] 
		ifFalse: [ type = #Fraccion ifTrue:
			[ (numerator * anObject denominator) = (denominator * anObject numerator) ]]]]! !

!Numero methodsFor: 'comparing' stamp: 'IACS 5/4/2022 22:00:07'!
hash
	self subclassResponsibility.! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'IACS 5/4/2022 21:57:21'!
// aDivisor 
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'IACS 5/4/2022 22:01:56'!
greatestCommonDivisorWith: anEntero 	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'IACS 5/4/2022 21:18:32'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^Entero new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'IACS 5/4/2022 21:20:00'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:25:17'!
* aMultiplier
	^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:28:02'!
+ anAdder
	^self class with: value + anAdder integerValue
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:41:29'!
negated
	^self * (self class with: -1).! !


!Entero methodsFor: 'printing' stamp: 'IACS 5/4/2022 21:52:50'!
printOn: aStream
	 aStream print: value.! !


!Entero methodsFor: 'arithmetic operations-private' stamp: 'IACS 5/4/2022 21:55:56'!
// aDivisor
	^self class with: value // aDivisor integerValue.! !

!Entero methodsFor: 'arithmetic operations-private' stamp: 'IACS 5/4/2022 22:00:45'!
greatestCommonDivisorWith: anEntero
	^self class with: (value gcd: anEntero integerValue).! !


!Entero methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:46:04'!
isNegative
	^value < 0.	! !

!Entero methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:48:09'!
isOne
	 ^value = 1.! !

!Entero methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:50:15'!
isZero
	 ^value = 0.! !


!Entero methodsFor: 'comparing' stamp: 'IACS 5/4/2022 21:58:19'!
hash
	^value hash.! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:46:48'!
isNegative
	^denominator < 0.! !

!Fraccion methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:48:46'!
isOne
	^false.! !

!Fraccion methodsFor: 'testing' stamp: 'IACS 5/4/2022 21:50:24'!
isZero
	^false.! !


!Fraccion methodsFor: 'printing' stamp: 'IACS 5/4/2022 21:53:38'!
printOn: aStream
	aStream print: numerator;
			
	nextPut: $/;
			
	print: denominator! !


!Fraccion methodsFor: 'arithmetic operations-private' stamp: 'IACS 5/4/2022 21:57:00'!
// aDivisor
	self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'arithmetic operations-private' stamp: 'IACS 5/4/2022 22:01:19'!
greatestCommonDivisorWith: anEntero
	self error: 'Tipo de número no soportado'.! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:04:09'!
* aMultiplier
	^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:28:22'!
+ anAdder
	 | newNumerator newDenominator |
		
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		
		newDenominator := denominator * anAdder denominator.
		
		^ self class with: newNumerator over: newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IACS 5/4/2022 21:41:45'!
negated
	^self class with: numerator * (self class with: -1) over: denominator! !


!Fraccion methodsFor: 'comparing' stamp: 'IACS 5/4/2022 21:59:00'!
hash
	^ (numerator hash / denominator hash) hash.! !

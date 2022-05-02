!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 21:40:49'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	
	customerBook := CustomerBook new.
	self timeIf: [customerBook addCustomerNamed: 'john Lennon']  RunsInLessThan: 50 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 21:42:50'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook |
	
	customerBook := CustomerBook createCustomerBookWith: 'paulMcCartney'.
	
	self timeIf: [customerBook removeCustomerNamed: 'paulMcCartney'] RunsInLessThan: 100 * millisecond.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 22:23:19'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |
	
	customerBook := CustomerBook new.
	
	self doAction: [ customerBook addCustomerNamed: ''. self fail ] whenError: Error verify: [ :anError | 
		
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			
			self assert: customerBook isEmpty].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 21:49:43'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	
	customerBook := CustomerBook createCustomerBookWith: johnLennon.
	
	self doAction: [ customerBook removeCustomerNamed: 'Paul McCartney'. self fail ] 
	whenError: NotFound verify: [ :anError | 
		
			self assert: customerBook numberOfCustomers = 1.
			
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 21:31:09'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook createCustomerBookWith: paulMcCartney.
	
	self do: [:aCustomerBook | aCustomerBook suspendCustomerNamed: paulMcCartney.] 
	On: customerBook ThenVerifyThatEverythingHasBeenCorrectlyModifiedTo: #(0 1 1 true).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 21:33:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook createCustomerBookWith: paulMcCartney.
	
	self do: [:aCustomerBook | 
		aCustomerBook suspendCustomerNamed: paulMcCartney.
		aCustomerBook removeCustomerNamed: paulMcCartney.] 
	On: customerBook ThenVerifyThatEverythingHasBeenCorrectlyModifiedTo: #(0 0 0 false).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 22:07:17'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook createCustomerBookWith: johnLennon.
	
	self do: [:aCustomerBook | aCustomerBook suspendCustomerNamed: 'Ringo Starr']  
	On: customerBook
	ThenCatch: CantSuspend 
	AndFinallyVerify: [:aCustomerBook | aCustomerBook numberOfCustomers = 1]  
	And: [:aCustomerBook | aCustomerBook  includesCustomerNamed: johnLennon] .

		
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IACS 5/1/2022 22:18:02'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook createCustomerBookWith: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self do: [:aCustomerBook | aCustomerBook suspendCustomerNamed: johnLennon]  
	On: customerBook
	ThenCatch: CantSuspend 
	AndFinallyVerify: [:aCustomerBook | aCustomerBook numberOfCustomers = 1]  
	And: [:aCustomerBook | aCustomerBook  includesCustomerNamed: johnLennon] .
! !


!CustomerBookTest methodsFor: 'private' stamp: 'IACS 5/1/2022 22:22:44'!
do: anAction On: anObject ThenCatch: anError AndFinallyVerify: firstStatement And: secondStatement
	[ anAction value: anObject. self fail.]
		on: anError 
		do: [ :theError | 
			self assert: (firstStatement value: anObject).
			self assert: (secondStatement value: anObject).]
! !

!CustomerBookTest methodsFor: 'private' stamp: 'IACS 5/1/2022 20:38:23'!
do: anAction On: customerBook ThenVerifyThatEverythingHasBeenCorrectlyModifiedTo: newFields
	anAction value: customerBook.
	self assert: (customerBook numberOfActiveCustomers) = (newFields at: 1).
	self assert: (customerBook numberOfSuspendedCustomers) = (newFields at: 2).
	self assert: (customerBook numberOfCustomers) = (newFields at: 3).
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney') = (newFields at: 4).
	! !

!CustomerBookTest methodsFor: 'private' stamp: 'IACS 5/1/2022 22:10:36'!
do: anAction ThenCatch: anError AndFinallyVerify: firstStatement And: secondStatement
	[ anAction. self fail.]
		on: anError 
		do: [ :theError | 
			self assert: firstStatement.
			self assert: secondStatement.]
! !

!CustomerBookTest methodsFor: 'private' stamp: 'IACS 5/1/2022 21:44:19'!
doAction: block whenError: anError verify: anotherBlock

	block on: anError do: anotherBlock.! !

!CustomerBookTest methodsFor: 'private' stamp: 'IACS 5/1/2022 21:41:02'!
timeIf: block RunsInLessThan: threshold
	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	block.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	self assert: (millisecondsAfterRunning - millisecondsBeforeRunning) < threshold! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'AT 5/1/2022 18:08:01'!
timeOf: block
	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	block.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^millisecondsAfterRunning - millisecondsBeforeRunning! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'testing' stamp: 'IACS 5/1/2022 19:40:13'!
createCustomerBookWith: aName
	^CustomerBook new addCustomerNamed: aName.! !

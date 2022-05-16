!classDefinition: #StackIsFull category: 'Stack-Exercise'!
Error subclass: #StackIsFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStackStates category: 'Stack-Exercise'!
TestCase subclass: #OOStackStates
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStates class' category: 'Stack-Exercise'!
OOStackStates class
	instanceVariableNames: ''!

!OOStackStates class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 14:19:46'!
popProtocol
	self subclassResponsibility.! !

!OOStackStates class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 15:50:27'!
pushProtocol
	self subclassResponsibility.! !

!OOStackStates class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 14:19:50'!
topProtocol
	self subclassResponsibility.! !


!OOStackStates class methodsFor: 'state searching' stamp: 'IACS 5/13/2022 14:19:24'!
isTheCurrentStateOf: aStack
	self subclassResponsibility.! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
OOStackStates subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 14:20:59'!
popProtocol
	self error: OOStack stackEmptyErrorDescription .! !

!EmptyStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 15:50:12'!
pushProtocol! !

!EmptyStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 14:21:04'!
topProtocol
	self error: OOStack stackEmptyErrorDescription .! !


!EmptyStack class methodsFor: 'state searching' stamp: 'IACS 5/13/2022 14:15:15'!
isTheCurrentStateOf: aStack
	^aStack isEmpty.! !


!classDefinition: #FullStack category: 'Stack-Exercise'!
OOStackStates subclass: #FullStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FullStack class' category: 'Stack-Exercise'!
FullStack class
	instanceVariableNames: ''!

!FullStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 15:49:56'!
popProtocol
	! !

!FullStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 15:54:28'!
pushProtocol
	self error: OOStack stackFullErrorDescription .
	! !

!FullStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 15:49:38'!
topProtocol
	! !


!FullStack class methodsFor: 'state searching' stamp: 'IACS 5/13/2022 15:49:07'!
isTheCurrentStateOf: aStack
	^aStack size = aStack capacity.! !


!classDefinition: #UnemptyStack category: 'Stack-Exercise'!
OOStackStates subclass: #UnemptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnemptyStack class' category: 'Stack-Exercise'!
UnemptyStack class
	instanceVariableNames: ''!

!UnemptyStack class methodsFor: 'state searching' stamp: 'IACS 5/13/2022 16:26:21'!
isTheCurrentStateOf: aStack
	^aStack size < aStack capacity.! !


!UnemptyStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 14:21:25'!
popProtocol! !

!UnemptyStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 15:50:19'!
pushProtocol! !

!UnemptyStack class methodsFor: 'state behavior' stamp: 'IACS 5/13/2022 14:21:30'!
topProtocol! !


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:51:50'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OONonFiniteStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:51:54'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OONonFiniteStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:51:59'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OONonFiniteStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:52:02'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OONonFiniteStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:52:06'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OONonFiniteStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:52:12'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OONonFiniteStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:52:21'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OONonFiniteStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:52:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OONonFiniteStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 14:52:33'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OONonFiniteStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 15:02:58'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	stack := OONonFiniteStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 15:39:15'!
test11FiniteStackShouldBeEmptyWhenCreated
	| stack |
	
	stack := OOFiniteStack createWithCapacitySetTo: 10.
	
	self assert: stack isEmpty.! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 15:43:47'!
test12CanNotPopWhenThereAreNoObjectsInAFiniteStack

	| stack  |
	
	stack := OOFiniteStack createWithCapacitySetTo: 10.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 15:43:52'!
test13FiniteStackIsFullWhenWeHaveInsertedEnoughObjects
	
	| stack firstPushedObject secondPushedObject |
	
	stack := OOFiniteStack createWithCapacitySetTo: 2.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack isFull.
! !

!OOStackTest methodsFor: 'test' stamp: 'IACS 5/13/2022 15:43:59'!
test14CanNotPushWhenTheFiniteStackIsFull

	| stack firstPushedObject secondPushedObject thirdPushedObject |
	
	stack := OOFiniteStack createWithCapacitySetTo: 2.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	thirdPushedObject := 'third'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self
		should: [ stack push: thirdPushedObject. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackFullErrorDescription ]! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:31:35'!
isEmpty
	self subclassResponsibility.! !

!OOStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:31:41'!
pop
	self subclassResponsibility.! !

!OOStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:31:45'!
push: aString 
	self subclassResponsibility.! !

!OOStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:31:49'!
size
	self subclassResponsibility.! !

!OOStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:31:53'!
top
	self subclassResponsibility.! !


!OOStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:30:42'!
capacity
	self subclassResponsibility.! !

!OOStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:34:18'!
checkIfThereIsATop	self subclassResponsibility.! !

!OOStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:34:28'!
checkIfWeCanPop	self subclassResponsibility.! !

!OOStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:34:58'!
checkIfWeCanPush	self subclassResponsibility.! !

!OOStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:36:32'!
initialize	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'IACS 5/13/2022 15:55:39'!
stackFullErrorDescription
	
	^ 'Stack is full'! !


!classDefinition: #OOFiniteStack category: 'Stack-Exercise'!
OOStack subclass: #OOFiniteStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:31:03'!
capacity
	^capacity.! !

!OOFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:33:56'!
checkIfThereIsATop
	| currentState |
	currentState := OOStackStates subclasses detect: [:aSubclass | (aSubclass isTheCurrentStateOf: self)].
	currentState topProtocol.! !

!OOFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:33:36'!
checkIfWeCanPop
	| currentState |
	currentState := OOStackStates subclasses detect: [:aSubclass | (aSubclass isTheCurrentStateOf: self)].
	currentState popProtocol.! !

!OOFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 15:53:40'!
checkIfWeCanPush
	| currentState |
	currentState := OOStackStates subclasses detect: [:aSubclass | (aSubclass isTheCurrentStateOf: self)].
	currentState pushProtocol.! !

!OOFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:38:18'!
initialize
	content := OrderedCollection new.
	capacity := 10.! !

!OOFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 17:24:57'!
setCapacityTo: aNumber
	"Si queremos capacidad 7.5, esto deja capacidad 8"
	"Si pide capacidad -2, deja capacidad 2. Pero creo que debería tirar error con capacidades negativas"
	capacity := (aNumber abs) ceiling.
	^self.! !


!OOFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:29:32'!
isEmpty
	^self size = 0.! !

!OOFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 15:46:45'!
isFull
	^self size = capacity.! !

!OOFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:29:42'!
pop
	self checkIfWeCanPop.
	^content removeLast.! !

!OOFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 15:53:06'!
push: aString 
	self checkIfWeCanPush.
	content add: aString.! !

!OOFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:32:42'!
size
	^content size.! !

!OOFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:30:06'!
top
	self checkIfThereIsATop.
	^content last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOFiniteStack class' category: 'Stack-Exercise'!
OOFiniteStack class
	instanceVariableNames: ''!

!OOFiniteStack class methodsFor: 'instance creation' stamp: 'IACS 5/13/2022 15:38:58'!
createWithCapacitySetTo: aNumber
	| stack |
	
	stack := OOFiniteStack new.
	^(stack setCapacityTo: aNumber).! !


!classDefinition: #OONonFiniteStack category: 'Stack-Exercise'!
OOStack subclass: #OONonFiniteStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONonFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 14:50:00'!
isEmpty
	^self size = 0.! !

!OONonFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 16:29:51'!
pop
	self checkIfWeCanPop.
	^content removeLast.! !

!OONonFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 14:50:27'!
push: aString 
	content add: aString.! !

!OONonFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 14:50:39'!
size
	^content size.! !

!OONonFiniteStack methodsFor: 'public' stamp: 'IACS 5/13/2022 14:50:48'!
top
	self checkIfThereIsATop.
	^content last.! !


!OONonFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:26:53'!
capacity
	^capacity.! !

!OONonFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 14:50:58'!
checkIfThereIsATop
	| currentState |
	currentState := OOStackStates subclasses detect: [:aSubclass | (aSubclass isTheCurrentStateOf: self)].
	currentState topProtocol.! !

!OONonFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 14:51:14'!
checkIfWeCanPop
	| currentState |
	currentState := OOStackStates subclasses detect: [:aSubclass | (aSubclass isTheCurrentStateOf: self)].
	currentState popProtocol.! !

!OONonFiniteStack methodsFor: 'private' stamp: 'IACS 5/13/2022 16:37:56'!
initialize
	content := OrderedCollection new.
	capacity := infinity.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

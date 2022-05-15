!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'Public' stamp: 'AT 5/12/2022 19:54:52'!
initialize
	content := OrderedCollection new.! !

!OOStack methodsFor: 'Public' stamp: 'AT 5/12/2022 20:04:56'!
isEmpty
	^self size = 0.! !

!OOStack methodsFor: 'Public' stamp: 'IACS 5/14/2022 22:10:45'!
pop
	self checkIfWeCanPop.
	^content removeLast.! !

!OOStack methodsFor: 'Public' stamp: 'AT 5/12/2022 19:57:34'!
push: aString 
	content add: aString.! !

!OOStack methodsFor: 'Public' stamp: 'AT 5/12/2022 20:04:43'!
size
	^content size.! !

!OOStack methodsFor: 'Public' stamp: 'IACS 5/14/2022 22:12:08'!
top
	self checkIfThereIsATop.
	^content last.! !


!OOStack methodsFor: 'Private' stamp: 'IACS 5/14/2022 22:12:22'!
checkIfThereIsATop	| currentState |
	currentState := OOStackState subclasses detect: [:aState | aState thisStateIsTheCurrentStateOf: self].
	currentState topResponse.! !

!OOStack methodsFor: 'Private' stamp: 'IACS 5/14/2022 22:11:41'!
checkIfWeCanPop	| currentState |
	currentState := OOStackState subclasses detect: [:aState | aState thisStateIsTheCurrentStateOf: self].
	currentState popResponse.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:09:00'!
popResponse
	self subclassResponsibility.! !

!OOStackState class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:09:03'!
topResponse
	self subclassResponsibility.! !


!OOStackState class methodsFor: 'state verification' stamp: 'IACS 5/14/2022 22:05:34'!
thisStateIsTheCurrentStateOf: aStack
	self subclassResponsibility.! !


!classDefinition: #Empty category: 'Stack-Exercise'!
OOStackState subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:13:11'!
popResponse
	self error: OOStack stackEmptyErrorDescription! !

!Empty class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:13:16'!
topResponse
	self error: OOStack stackEmptyErrorDescription! !


!Empty class methodsFor: 'state verification' stamp: 'IACS 5/14/2022 22:05:10'!
thisStateIsTheCurrentStateOf: aStack
	^aStack isEmpty.! !


!classDefinition: #Unempty category: 'Stack-Exercise'!
OOStackState subclass: #Unempty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Unempty class' category: 'Stack-Exercise'!
Unempty class
	instanceVariableNames: ''!

!Unempty class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:09:56'!
popResponse! !

!Unempty class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:10:02'!
topResponse! !


!Unempty class methodsFor: 'state verification' stamp: 'IACS 5/14/2022 22:10:22'!
thisStateIsTheCurrentStateOf: aStack
	^(aStack isEmpty) not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

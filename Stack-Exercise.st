!classDefinition: #OOQueue category: 'Stack-Exercise'!
TestCase subclass: #OOQueue
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOQueue methodsFor: 'public' stamp: 'IACS 5/15/2022 11:41:38'!
dequeue
	self checkIfWeCanDequeue.
	^content removeFirst.! !

!OOQueue methodsFor: 'public' stamp: 'IACS 5/15/2022 11:46:58'!
enqueue: aString
	content addLast: aString.! !

!OOQueue methodsFor: 'public' stamp: 'IACS 5/15/2022 11:49:48'!
front
	self checkIfThereIsAFront.
	^content first.! !

!OOQueue methodsFor: 'public' stamp: 'IACS 5/15/2022 11:13:20'!
isEmpty
	^self size = 0.! !

!OOQueue methodsFor: 'public' stamp: 'IACS 5/15/2022 11:13:54'!
size
	^content size.! !


!OOQueue methodsFor: 'private' stamp: 'IACS 5/15/2022 11:30:48'!
checkIfThereIsAFront
	| currentState |
	currentState := OOQueueState subclasses detect: [:aState | aState thisStateIsTheCurrentStateOf: self].
	currentState frontResponse.! !

!OOQueue methodsFor: 'private' stamp: 'IACS 5/15/2022 11:37:45'!
checkIfWeCanDequeue
	| currentState |
	currentState := OOQueueState subclasses detect: [:aState | aState thisStateIsTheCurrentStateOf: self].
	currentState dequeueResponse.! !

!OOQueue methodsFor: 'private' stamp: 'IACS 5/15/2022 11:12:46'!
initialize
	content := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOQueue class' category: 'Stack-Exercise'!
OOQueue class
	instanceVariableNames: ''!

!OOQueue class methodsFor: 'error descriptions' stamp: 'IACS 5/15/2022 11:28:52'!
queueEmptyErrorDescription
	
	^ 'Queue is empty'! !


!classDefinition: #OOQueueTest category: 'Stack-Exercise'!
TestCase subclass: #OOQueueTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:33:49'!
test01QueueShouldBeEmptyWhenCreated

	| queue |
	
	queue := OOQueue new.
	
	self assert: queue isEmpty! !

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:36:50'!
test02EnqueueAddElementsToTheQueue

	| queue |
	
	queue := OOQueue new.
	queue enqueue: 'something'.
	
	self deny: queue isEmpty! !

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:39:01'!
test03DequeueRemovesElementsFromTheQueue

	| queue |
	
	queue := OOQueue new.
	queue enqueue: 'something'.
	queue dequeue.
	
	self assert: queue isEmpty! !

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:42:03'!
test04DequeueReturnsFirstEnqueuedObject

	| queue enqueuedObject |
	
	queue := OOQueue new.
	enqueuedObject := 'something'.
	queue enqueue: enqueuedObject.
	
	self assert: queue dequeue = enqueuedObject! !

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:44:11'!
test05QueueBehavesFIFO

	| queue firstEnqueuedObject secondEnqueuedObject |
	
	queue := OOQueue new.
	firstEnqueuedObject := 'first'.
	secondEnqueuedObject := 'second'.
	
	queue enqueue: firstEnqueuedObject.
	queue enqueue: secondEnqueuedObject.
	
	self assert: queue dequeue = firstEnqueuedObject.
	self assert: queue dequeue = secondEnqueuedObject.
	self assert: queue isEmpty 
	! !

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:49:10'!
test06FrontReturnsFirstEnqueuedObject

	| queue enqueuedObject |
	
	queue := OOQueue new.
	enqueuedObject := 'something'.
	
	queue enqueue: enqueuedObject.
	
	self assert: queue front = enqueuedObject.
	! !

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:51:22'!
test07CanNotDequeueWhenThereAreNoObjectsInTheQueue

	| queue |
	
	queue := OOQueue new.
	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOQueue queueEmptyErrorDescription ]
		
! !

!OOQueueTest methodsFor: 'test' stamp: 'IACS 5/15/2022 11:51:51'!
test08CanNotFrontWhenThereAreNoObjectsInTheQueue

	| queue |
	
	queue := OOQueue new.
	self
		should: [ queue front ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOQueue queueEmptyErrorDescription ]
		
! !


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


!classDefinition: #OOQueueState category: 'Stack-Exercise'!
Object subclass: #OOQueueState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOQueueState class' category: 'Stack-Exercise'!
OOQueueState class
	instanceVariableNames: ''!

!OOQueueState class methodsFor: 'state verification' stamp: 'IACS 5/15/2022 11:22:34'!
thisStateIsTheCurrentStateOf: aQueue
	self subclassResponsibility.! !


!OOQueueState class methodsFor: 'state responses' stamp: 'IACS 5/15/2022 11:37:56'!
dequeueResponse
	self subclassResponsibility.! !

!OOQueueState class methodsFor: 'state responses' stamp: 'IACS 5/15/2022 11:22:55'!
frontResponse
	self subclassResponsibility.! !


!classDefinition: #EmptyQueue category: 'Stack-Exercise'!
OOQueueState subclass: #EmptyQueue
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyQueue class' category: 'Stack-Exercise'!
EmptyQueue class
	instanceVariableNames: ''!

!EmptyQueue class methodsFor: 'state responses' stamp: 'IACS 5/15/2022 11:29:36'!
dequeueResponse
	self error: OOQueue queueEmptyErrorDescription! !

!EmptyQueue class methodsFor: 'state responses' stamp: 'IACS 5/15/2022 11:29:42'!
frontResponse
	self error: OOQueue queueEmptyErrorDescription! !


!EmptyQueue class methodsFor: 'state verification' stamp: 'IACS 5/15/2022 11:27:03'!
thisStateIsTheCurrentStateOf: aQueue
	^aQueue isEmpty.! !


!classDefinition: #UnemptyQueue category: 'Stack-Exercise'!
OOQueueState subclass: #UnemptyQueue
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnemptyQueue class' category: 'Stack-Exercise'!
UnemptyQueue class
	instanceVariableNames: ''!

!UnemptyQueue class methodsFor: 'state responses' stamp: 'IACS 5/15/2022 11:29:58'!
dequeueResponse! !

!UnemptyQueue class methodsFor: 'state responses' stamp: 'IACS 5/15/2022 11:29:53'!
frontResponse! !


!UnemptyQueue class methodsFor: 'state verification' stamp: 'IACS 5/15/2022 11:26:27'!
thisStateIsTheCurrentStateOf: aQueue
	^(aQueue isEmpty) not.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

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

!OOStack methodsFor: 'Private' stamp: 'AT 5/12/2022 19:54:52'!
initialize
	content := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
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


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
OOStackState subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:13:11'!
popResponse
	self error: OOStack stackEmptyErrorDescription! !

!EmptyStack class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:13:16'!
topResponse
	self error: OOStack stackEmptyErrorDescription! !


!EmptyStack class methodsFor: 'state verification' stamp: 'IACS 5/14/2022 22:05:10'!
thisStateIsTheCurrentStateOf: aStack
	^aStack isEmpty.! !


!classDefinition: #UnemptyStack category: 'Stack-Exercise'!
OOStackState subclass: #UnemptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnemptyStack class' category: 'Stack-Exercise'!
UnemptyStack class
	instanceVariableNames: ''!

!UnemptyStack class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:09:56'!
popResponse! !

!UnemptyStack class methodsFor: 'state responses' stamp: 'IACS 5/14/2022 22:10:02'!
topResponse! !


!UnemptyStack class methodsFor: 'state verification' stamp: 'IACS 5/14/2022 22:10:22'!
thisStateIsTheCurrentStateOf: aStack
	^(aStack isEmpty) not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

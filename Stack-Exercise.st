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
	instanceVariableNames: 'emptyStack stackWithBuenas stackWithBuenasTardes stringBuenas stringTardes sentenceFinderByPrefix stringBuenasTardes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 17:22:21'!
test1TryingToSearchInAnEmptyStackThrowsError
	self
		should: [ sentenceFinderByPrefix searchForPhrasesWith: stringBuenas in: emptyStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 17:23:12'!
test2SearchingInAStackWithoutStringsWithThePrefixReturnsEmptyCollection
	| prefix foundPhrases |
	
	prefix := 'Hola'.
	foundPhrases := sentenceFinderByPrefix searchForPhrasesWith: prefix in: stackWithBuenas.
	
	self assert: foundPhrases size = 0.  ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 17:24:10'!
test3SearchingInAStackDoesNotModifyTheSizeOfTheStack
	| prefix |
	
	prefix := 'Hola'.
	sentenceFinderByPrefix searchForPhrasesWith: prefix in: stackWithBuenas.
	
	self assert: stackWithBuenas size = 1.	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 17:24:47'!
test4SearchingInAStackDoesNotModifyTheElementsOfTheStack
	| prefix |
	
	prefix := 'Hola'.
	sentenceFinderByPrefix searchForPhrasesWith: prefix in: stackWithBuenasTardes.
	
	self assert: stackWithBuenasTardes size = 1.	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 22:14:50'!
test5SeachingInAStackWithStringsThatContainThePrefixYieldsTheStringsWithThePrefix
	| prefix foundStrings |
	
	prefix := 'buenas'.
	foundStrings := sentenceFinderByPrefix searchForPhrasesWith: prefix in: stackWithBuenasTardes.
	
	self assert: foundStrings first =  stringBuenasTardes.	
	self assert: foundStrings second = stringBuenas.	! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'IACS 5/15/2022 17:21:47'!
setUp

	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	stringBuenas := 'buenas'.
	stringTardes := 'tardes'.
	stringBuenasTardes := 'buenas tardes'.
	
	emptyStack := OOStack new.
	
	stackWithBuenas := OOStack new.
	stackWithBuenas push: stringBuenas.
	
	stackWithBuenasTardes := OOStack new.
	stackWithBuenasTardes push: stringBuenas.
	stackWithBuenasTardes push: stringTardes.
	stackWithBuenasTardes push: stringBuenasTardes.
	! !


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
	instanceVariableNames: 'alreadyConsideredStrings stringsWithThePrefix patternWithThePrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'IACS 5/15/2022 22:10:13'!
searchForPhrasesWith: aPrefix in: aStack
	
	self verifyThatTheStackIsNotEmpty: aStack.
	self setUpSearch.
	
	(aStack size) timesRepeat:
	[
		| currentObject |
		currentObject := aStack pop.
		alreadyConsideredStrings add: currentObject	.
		(currentObject beginsWith: aPrefix) ifTrue: [ stringsWithThePrefix add: currentObject ]
	].

	self sendBackAllElementsFrom: alreadyConsideredStrings To: aStack.
	
	^ stringsWithThePrefix.! !

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'IACS 5/15/2022 22:11:41'!
sendBackAllElementsFrom: aCollectionOfTheStringsTaken To: aStack! !

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'IACS 5/15/2022 17:52:30'!
setUpSearch
	alreadyConsideredStrings := OrderedCollection new.
	stringsWithThePrefix  := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'IACS 5/15/2022 16:32:13'!
verifyThatTheStackIsNotEmpty: aStack
	aStack top.! !

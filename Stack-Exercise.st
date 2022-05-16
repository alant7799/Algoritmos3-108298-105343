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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test1TryingToSearchInAnEmptyStackThrowsError
	self
		should: [ sentenceFinderByPrefix searchForStringWith: stringBuenas in: emptyStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test2SearchingInAStackWithoutStringsWithThePrefixReturnsEmptyCollection
	| prefix foundPhrases |
	
	prefix := 'Hola'.
	foundPhrases := sentenceFinderByPrefix searchForStringWith: prefix in: stackWithBuenas.
	
	self assert: foundPhrases size = 0.  ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test3SearchingInAStackDoesNotModifyTheSizeOfTheStack
	| prefix |
	
	prefix := 'Hola'.
	sentenceFinderByPrefix searchForStringWith: prefix in: stackWithBuenas.
	
	self assert: stackWithBuenas size = 1.	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test4SearchingInAStackDoesNotModifyTheElementsOrder
	| prefix |
	
	prefix := 'Hola'.
	sentenceFinderByPrefix searchForStringWith: prefix in: stackWithBuenasTardes.
	
	stringBuenas := 'buenas'.
	stringTardes := 'tardes'.
	stringBuenasTardes := 'buenas tardes'.
	
	self assert: stringBuenasTardes = stackWithBuenasTardes pop.
	self assert: stringTardes = stackWithBuenasTardes pop.
	self assert: stringBuenas = stackWithBuenasTardes pop.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test5SeachingInAStackWithStringsThatContainThePrefixYieldsTheStringsWithThePrefix
	| prefix foundStrings |
	
	prefix := 'buenas'.
	foundStrings := sentenceFinderByPrefix searchForStringWith: prefix in: stackWithBuenasTardes.
	
	self assert: foundStrings first =  stringBuenasTardes.	
	self assert: foundStrings second = stringBuenas.	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test6TryingToSearchWithAPrefixWithBlanksThrowsError
self
	should: [ sentenceFinderByPrefix searchForStringWith: ' Buenas' in: stackWithBuenas ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = InvalidPrefixDueToBlank stringWithBlankErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test7TryingToSearchWithAnEmptyPrefixThrowsAnError
self
	should: [ sentenceFinderByPrefix searchForStringWith: '' in: stackWithBuenas ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = InvalidPrefixDueToEmptyString emptyStringErrorDescription ].

! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AT 5/16/2022 00:20:40'!
test8SeachInAstackWithStringsIsCaseSensitive
	| prefix foundStrings |
	
	prefix := 'Buenas'.
	foundStrings := sentenceFinderByPrefix searchForStringWith: prefix in: stackWithBuenasTardes.
	
	self assert: foundStrings isEmpty.	! !


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


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'string'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'as yet unclassified' stamp: 'AT 5/15/2022 23:32:37'!
isThatGivenStringIsAValidPrefix: aString
	| stringSubclass | 
	stringSubclass := Prefix subclasses detect:[:aSubclass | aSubclass stringIsFromThisSubclass: aString].
	^stringSubclass isValid.
	! !

!Prefix class methodsFor: 'as yet unclassified' stamp: 'AT 5/15/2022 23:39:47'!
isValid

	self subclassResponsibility.
	! !

!Prefix class methodsFor: 'as yet unclassified' stamp: 'AT 5/15/2022 23:36:28'!
stringIsFromThisSubclass: aString
	
	self subclassResponsibility.! !


!classDefinition: #InvalidPrefixDueToBlank category: 'Stack-Exercise'!
Prefix subclass: #InvalidPrefixDueToBlank
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefixDueToBlank class' category: 'Stack-Exercise'!
InvalidPrefixDueToBlank class
	instanceVariableNames: ''!

!InvalidPrefixDueToBlank class methodsFor: 'as yet unclassified' stamp: 'IACS 5/16/2022 00:11:40'!
isValid
	
	self error: InvalidPrefixDueToBlank stringWithBlankErrorDescription.! !

!InvalidPrefixDueToBlank class methodsFor: 'as yet unclassified' stamp: 'AT 5/15/2022 23:39:28'!
stringIsFromThisSubclass: aString
	^ aString includesSubString: ' '.! !

!InvalidPrefixDueToBlank class methodsFor: 'as yet unclassified' stamp: 'IACS 5/16/2022 00:11:26'!
stringWithBlankErrorDescription
	
	^'string has blank character.'.! !


!classDefinition: #InvalidPrefixDueToEmptyString category: 'Stack-Exercise'!
Prefix subclass: #InvalidPrefixDueToEmptyString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefixDueToEmptyString class' category: 'Stack-Exercise'!
InvalidPrefixDueToEmptyString class
	instanceVariableNames: ''!

!InvalidPrefixDueToEmptyString class methodsFor: 'as yet unclassified' stamp: 'AT 5/15/2022 23:52:04'!
emptyStringErrorDescription

	^'String is Empty.'.! !

!InvalidPrefixDueToEmptyString class methodsFor: 'as yet unclassified' stamp: 'AT 5/15/2022 23:48:18'!
isValid
	self error: InvalidPrefixDueToEmptyString emptyStringErrorDescription.! !

!InvalidPrefixDueToEmptyString class methodsFor: 'as yet unclassified' stamp: 'AT 5/15/2022 23:37:01'!
stringIsFromThisSubclass: aString
	^aString isEmpty.! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'as yet unclassified' stamp: 'AT 5/16/2022 00:01:18'!
isValid! !

!ValidPrefix class methodsFor: 'as yet unclassified' stamp: 'IACS 5/16/2022 00:07:25'!
stringIsFromThisSubclass: aString
	^aString isEmpty not and: (aString includesSubString: ' ') not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'alreadyConsideredStrings stringsWithThePrefix patternWithThePrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'AT 5/16/2022 00:20:40'!
searchForStringWith: aPrefix in: aStack
	
	Prefix isThatGivenStringIsAValidPrefix: aPrefix.
	self verifyThatTheStackIsNotEmpty: aStack.
	self setUpSearch.
	
	(aStack size) timesRepeat:
	[
		| currentObject |
		currentObject := aStack pop.
		alreadyConsideredStrings add: currentObject	.
	].
	
	stringsWithThePrefix := alreadyConsideredStrings select: [:currentObject | currentObject beginsWith: aPrefix].
	self sendBackAllElementsFrom: alreadyConsideredStrings To: aStack.
	
	^ stringsWithThePrefix.! !

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'AT 5/15/2022 22:46:17'!
sendBackAllElementsFrom: aCollectionOfTheStringsTaken To: aStack
	aCollectionOfTheStringsTaken reverseDo: [:string | aStack push: string].! !

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'IACS 5/15/2022 17:52:30'!
setUpSearch
	alreadyConsideredStrings := OrderedCollection new.
	stringsWithThePrefix  := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'IACS 5/15/2022 16:32:13'!
verifyThatTheStackIsNotEmpty: aStack
	aStack top.! !

!SentenceFinderByPrefix methodsFor: 'stack searching' stamp: 'AT 5/15/2022 23:05:31'!
verifyThatTheStringIsNotEmpty: aStack
	! !

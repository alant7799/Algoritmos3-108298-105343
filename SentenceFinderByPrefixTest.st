'From Cuis 6.0 [latest update: #5093] on 15 May 2022 at 11:56:06 pm'!
!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack stackWithBuenas stackWithBuenasTardes stringBuenas stringTardes sentenceFinderByPrefix stringBuenasTardes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 22:48:51'!
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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 22:52:58'!
test4SearchingInAStackDoesNotModifyTheOrderOfTheElementsOfTheStack
	| prefix |
	
	prefix := 'Hola'.
	sentenceFinderByPrefix searchForPhrasesWith: prefix in: stackWithBuenasTardes.
	
	self assert: stackWithBuenasTardes pop = stringBuenasTardes.
	self assert: stackWithBuenasTardes pop = stringTardes.
	self assert: stackWithBuenasTardes pop = stringBuenas.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 22:14:50'!
test5SeachingInAStackWithStringsThatContainThePrefixYieldsTheStringsWithThePrefix
	| prefix foundStrings |
	
	prefix := 'buenas'.
	foundStrings := sentenceFinderByPrefix searchForPhrasesWith: prefix in: stackWithBuenasTardes.
	
	self assert: foundStrings first =  stringBuenasTardes.	
	self assert: foundStrings second = stringBuenas.	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 23:05:07'!
test6TryingToSearchWithAPrefixWithBlanksThrowsError
self
	should: [ sentenceFinderByPrefix searchForPhrasesWith: ' Buenas' in: stackWithBuenas ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix invalidPrefixDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'IACS 5/15/2022 23:05:16'!
test7TryingToSearchWithAnEmptyPrefixThrowsAnError
self
	should: [ sentenceFinderByPrefix searchForPhrasesWith: '' in: stackWithBuenas ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix invalidPrefixDescription ].! !


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

!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRoverAtx69y69'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'exception handling' stamp: 'IACS 5/31/2022 18:54:05'!
test15SendingACommandWithTheWrongFormatToTheMarsRoverThrowsAnError
	self
		should: [ marsRoverAtx69y69 receiveCommand: 720 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandException ].! !

!MarsRoverTests methodsFor: 'exception handling' stamp: 'IACS 5/31/2022 19:04:56'!
test16SendingAnUndefinedCommandToTheMarsRoverThrowsAnError
	self
		should: [ marsRoverAtx69y69 receiveCommand: '7' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover undefinedCommandException ].! !

!MarsRoverTests methodsFor: 'exception handling' stamp: 'IACS 5/31/2022 19:12:16'!
test17SendingAnUndefinedCommandToTheMarsRoverKeepsTheCommandsSentBefore
	self
		should: [ marsRoverAtx69y69 receiveCommand: 'llfz' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover undefinedCommandException.
			self assert: marsRoverAtx69y69 position = (69@68).
			self assert: marsRoverAtx69y69 direction = 'S'].! !

!MarsRoverTests methodsFor: 'exception handling' stamp: 'IACS 5/31/2022 19:12:50'!
test18MarsRoverStopsReceivingCommandsAfterReceivingAnUndefinedCommand
	self
		should: [ marsRoverAtx69y69 receiveCommand: 'llfzbl' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover undefinedCommandException.
			self assert: marsRoverAtx69y69 position = (69@68).
			self assert: marsRoverAtx69y69 direction = 'S'].! !


!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:29:53'!
test01AMarsRoverCanBeCreatedAtASpecificPositionPointingToASpecificDirection
	self assert: marsRoverAtx69y69 position = (69@69). 
	self assert: marsRoverAtx69y69 direction = 'N'.
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:30:05'!
test02TheDirectionTheMarsRoverIsPointingToCanBeCommandedToChange
	marsRoverAtx69y69 receiveCommand: 'l'.
	self assert: marsRoverAtx69y69 direction = 'O'.! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:30:17'!
test03TheDirectionTheMarsRoverIsPointingToCanBeCommandedToChangeSuccesively
	marsRoverAtx69y69 receiveCommand: 'l'.
	marsRoverAtx69y69 receiveCommand: 'l'.
	self assert: marsRoverAtx69y69 direction = 'S'.! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:30:33'!
test04TheDirectionCanBeChangedInMultipleDirections
	marsRoverAtx69y69 receiveCommand: 'l'.
	marsRoverAtx69y69 receiveCommand: 'r'.
	marsRoverAtx69y69 receiveCommand: 'r'.
	self assert: marsRoverAtx69y69 direction = 'E'.! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:30:44'!
test05MarsRoverCanMoveForward
	marsRoverAtx69y69 receiveCommand: 'f'.
	self assert: marsRoverAtx69y69 position = (69@70).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:31:06'!
test06MarsRoverCanMoveForwardSuccesively
	marsRoverAtx69y69 receiveCommand: 'f'.
	marsRoverAtx69y69 receiveCommand: 'f'.
	marsRoverAtx69y69 receiveCommand: 'f'.
	marsRoverAtx69y69 receiveCommand: 'f'.
	self assert: marsRoverAtx69y69 position = (69@73).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:31:25'!
test07MarsRoverCanMoveForwardAfterRotating
	marsRoverAtx69y69 receiveCommand: 'f'.
	marsRoverAtx69y69 receiveCommand: 'l'.
	marsRoverAtx69y69 receiveCommand: 'f'.
	marsRoverAtx69y69 receiveCommand: 'l'.
	marsRoverAtx69y69 receiveCommand: 'f'.
	self assert: marsRoverAtx69y69 position = (68@69).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:31:36'!
test08MarsRoverCanMoveBackwards
	marsRoverAtx69y69 receiveCommand: 'b'.
	self assert: marsRoverAtx69y69 position = (69@68).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:31:49'!
test09MarsRoverCanMoveForwardSuccesively
	marsRoverAtx69y69 receiveCommand: 'b'.
	marsRoverAtx69y69 receiveCommand: 'b'.
	marsRoverAtx69y69 receiveCommand: 'b'.
	self assert: marsRoverAtx69y69 position = (69@66).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 12:32:03'!
test10MarsRoverCanMoveBackwardsAfterRotating
	marsRoverAtx69y69 receiveCommand: 'b'.
	marsRoverAtx69y69 receiveCommand: 'l'.
	marsRoverAtx69y69 receiveCommand: 'b'.
	marsRoverAtx69y69 receiveCommand: 'l'.
	marsRoverAtx69y69 receiveCommand: 'b'.
	self assert: marsRoverAtx69y69 position = (70@69).
	! !


!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 12:32:13'!
test11MarsRoverCanMultipleCommandsOfMovingForwardFromASingleString
	marsRoverAtx69y69 receiveCommand: 'fffff'.
	self assert: marsRoverAtx69y69 position = (69@74).
	! !

!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 12:32:24'!
test12MarsRoverCanMultipleCommandsOfMovingBackwardsFromASingleString
	marsRoverAtx69y69 receiveCommand: 'bbb'.
	self assert: marsRoverAtx69y69 position = (69@66).
	! !

!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 12:32:35'!
test13MarsRoverCanUnderstandMultipleCommandsOfRotatingFromASingleString
	marsRoverAtx69y69 receiveCommand: 'llllrrrr'.
	self assert: marsRoverAtx69y69 position = (69@69).
	self assert: marsRoverAtx69y69 direction = 'N'.
	! !

!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 12:32:45'!
test14MarsRoverCanMultipleCommandsOfDifferentTypesFromOneString
	marsRoverAtx69y69 receiveCommand: 'blblf'.
	self assert: marsRoverAtx69y69 position = (70@67).
	! !


!MarsRoverTests methodsFor: 'setup' stamp: 'IACS 5/30/2022 12:29:37'!
setUp
	marsRoverAtx69y69 := MarsRover createAtPosition: (69@69) PointingTo: 'N'. ! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position directionPointingTo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRover commentStamp: '<historical>' prior: 0!
I represent a Mars Rover!


!MarsRover methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 21:52:13'!
initializeAtPosition: aPosition PointingTo: aCardinalPoint 
	position := aPosition.
	directionPointingTo := aCardinalPoint.! !


!MarsRover methodsFor: 'positioning' stamp: 'IACS 5/29/2022 21:40:16'!
isAtTheOrigin
	^position = (0@0).! !

!MarsRover methodsFor: 'positioning' stamp: 'IACS 5/29/2022 21:32:56'!
position
	^position.! !


!MarsRover methodsFor: 'directioning' stamp: 'IACS 5/29/2022 21:52:01'!
direction
	^directionPointingTo.! !


!MarsRover methodsFor: 'private' stamp: 'IACS 5/29/2022 23:26:08'!
changeDirectionTo: aDirection
	directionPointingTo := aDirection.! !

!MarsRover methodsFor: 'private' stamp: 'IACS 5/29/2022 23:54:09'!
changePositionByAdding: anAddend
	| currentPosition |
	currentPosition := position.
	position := currentPosition + anAddend.! !


!MarsRover methodsFor: 'command processing' stamp: 'IACS 5/31/2022 18:35:23'!
receiveCommand: aCommand	self verifyThatTheFormatOfTheCommandIsCorrect: aCommand.
	aCommand do: [ :aSubcommand | 
		| processedSubcommand |
		processedSubcommand := MarsRoverCommands processTheCommand: aSubcommand asString .
		processedSubcommand sendProtocolTo: self.].! !

!MarsRover methodsFor: 'command processing' stamp: 'IACS 5/31/2022 18:50:58'!
verifyThatTheFormatOfTheCommandIsCorrect: aCommand
	MarsRoverCommands verifyThatTheCommandIsValid: aCommand.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 21:50:21'!
createAtPosition: aPosition PointingTo: aCardinalPoint 
	^self new initializeAtPosition: aPosition PointingTo: aCardinalPoint. ! !


!MarsRover class methodsFor: 'exceptions' stamp: 'IACS 5/31/2022 18:50:20'!
invalidCommandException
	^'The command sent has invalid format. The Mars Rover only understands strings'.! !

!MarsRover class methodsFor: 'exceptions' stamp: 'IACS 5/31/2022 18:27:17'!
undefinedCommandException
	^'The sent command is not understood by the current Mars Rover'.! !


!classDefinition: #MarsRoverCommands category: 'MarsRover'!
Object subclass: #MarsRoverCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverCommands commentStamp: '<historical>' prior: 0!
I represent the idea of a command to the Mars Rover.!


!MarsRoverCommands methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 23:04:46'!
initialize
	self subclassResponsibility .! !


!MarsRoverCommands methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:18:44'!
sendProtocolTo: aMarsRover
	self subclassResponsibility .																									! !

!MarsRoverCommands methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:07:55'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	self subclassResponsibility .! !


!MarsRoverCommands methodsFor: 'validity' stamp: 'IACS 5/31/2022 18:48:20'!
confirmValidity
	self subclassResponsibility.! !

!MarsRoverCommands methodsFor: 'validity' stamp: 'IACS 5/31/2022 18:45:02'!
thisCommandIsValid: aCommand
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommands class' category: 'MarsRover'!
MarsRoverCommands class
	instanceVariableNames: ''!

!MarsRoverCommands class methodsFor: 'instance creation' stamp: 'IACS 5/31/2022 19:09:21'!
processTheCommand: aReceivedCommand
	| receivedCommand |
	receivedCommand := MarsRoverDefinedCommands allSubclasses detect: [ :aSubclass | aSubclass new thisIsTheCorrectCommandAfterReceiving: aReceivedCommand] 
	ifNone: [self error: MarsRover undefinedCommandException] .
	^receivedCommand new.! !

!MarsRoverCommands class methodsFor: 'instance creation' stamp: 'IACS 5/31/2022 18:47:56'!
verifyThatTheCommandIsValid: aReceivedCommand
	| receivedCommandSubclass |
	receivedCommandSubclass := self allSubclasses detect: [ :aSubclass | aSubclass new thisCommandIsValid: aReceivedCommand].
	receivedCommandSubclass new confirmValidity.! !


!classDefinition: #MarsRoverDefinedCommands category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverDefinedCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverDefinedCommands commentStamp: '<historical>' prior: 0!
I represent the idea of a command the Mars Rover understands or has potential to eventually understand, that is, commands with correct string format.!


!MarsRoverDefinedCommands methodsFor: 'validity' stamp: 'IACS 5/31/2022 18:48:43'!
confirmValidity
	^true.! !

!MarsRoverDefinedCommands methodsFor: 'validity' stamp: 'IACS 5/31/2022 18:44:26'!
thisCommandIsValid: aCommand
	^aCommand isString. ! !


!MarsRoverDefinedCommands methodsFor: 'instance creation' stamp: 'IACS 5/31/2022 18:53:20'!
initialize! !


!classDefinition: #MarsRoverMoveCommands category: 'MarsRover'!
MarsRoverDefinedCommands subclass: #MarsRoverMoveCommands
	instanceVariableNames: 'coordinateTranslationsToDo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverMoveCommands commentStamp: '<historical>' prior: 0!
My instances are commands that change the position of the Mars Rover.!


!MarsRoverMoveCommands methodsFor: 'command selection' stamp: 'AT 5/30/2022 12:59:13'!
sendProtocolTo: aMarsRover
	| addend |
	addend := coordinateTranslationsToDo at: aMarsRover direction.							
	aMarsRover changePositionByAdding: addend.! !

!MarsRoverMoveCommands methodsFor: 'command selection' stamp: 'IACS 5/30/2022 12:14:57'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^false.! !


!MarsRoverMoveCommands methodsFor: 'instance creation' stamp: 'AT 5/30/2022 12:59:02'!
initialize
	
	! !


!classDefinition: #MarsRoverMoveBackwards category: 'MarsRover'!
MarsRoverMoveCommands subclass: #MarsRoverMoveBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverMoveBackwards commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for moving backwards.!


!MarsRoverMoveBackwards methodsFor: 'command selection' stamp: 'AT 5/30/2022 12:58:21'!
initialize
	coordinateTranslationsToDo := Dictionary new.
	coordinateTranslationsToDo at: 'N' put: (0@-1).
	coordinateTranslationsToDo at: 'O' put: (1@0).
	coordinateTranslationsToDo at: 'S' put: (0@1).
	coordinateTranslationsToDo at: 'E' put: (-1@0).
	! !

!MarsRoverMoveBackwards methodsFor: 'command selection' stamp: 'IACS 5/30/2022 00:05:03'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'b'.! !


!classDefinition: #MarsRoverMoveForward category: 'MarsRover'!
MarsRoverMoveCommands subclass: #MarsRoverMoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverMoveForward commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for moving forward!


!MarsRoverMoveForward methodsFor: 'command selection' stamp: 'AT 5/30/2022 12:58:02'!
initialize
	coordinateTranslationsToDo := Dictionary new.
	coordinateTranslationsToDo at: 'N' put: (0@1).
	coordinateTranslationsToDo at: 'O' put: (-1@0).
	coordinateTranslationsToDo at: 'S' put: (0@-1).
	coordinateTranslationsToDo at: 'E' put: (1@0).
	! !

!MarsRoverMoveForward methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:44:40'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'f'.! !


!classDefinition: #MarsRoverRotationCommands category: 'MarsRover'!
MarsRoverDefinedCommands subclass: #MarsRoverRotationCommands
	instanceVariableNames: 'directionsAfterTurning'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverRotationCommands commentStamp: '<historical>' prior: 0!
My instances are commands in which the Mars Rover rotates.!


!MarsRoverRotationCommands methodsFor: 'command selection' stamp: 'AT 5/30/2022 13:01:18'!
sendProtocolTo: aMarsRover
	| directionAfterTurning |
	directionAfterTurning := directionsAfterTurning at: aMarsRover direction.							
	aMarsRover changeDirectionTo: directionAfterTurning.! !

!MarsRoverRotationCommands methodsFor: 'command selection' stamp: 'AT 5/30/2022 13:03:25'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^false.! !


!MarsRoverRotationCommands methodsFor: 'instance creation' stamp: 'AT 5/30/2022 13:03:04'!
initialize! !


!classDefinition: #MarsRoverTurnLeft category: 'MarsRover'!
MarsRoverRotationCommands subclass: #MarsRoverTurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverTurnLeft commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for turning left by 90 degrees!


!MarsRoverTurnLeft methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:07:41'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'l'.! !


!MarsRoverTurnLeft methodsFor: 'instance creation' stamp: 'AT 5/30/2022 13:02:58'!
initialize
	directionsAfterTurning := Dictionary new.
	directionsAfterTurning at: 'N' put: 'O'.
	directionsAfterTurning at: 'O' put: 'S'.
	directionsAfterTurning at: 'S' put: 'E'.
	directionsAfterTurning at: 'E' put: 'N'.
	
	! !


!classDefinition: #MarsRoverTurnRight category: 'MarsRover'!
MarsRoverRotationCommands subclass: #MarsRoverTurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverTurnRight commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for turning right by 90 degrees!


!MarsRoverTurnRight methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:08:18'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'r'.! !


!MarsRoverTurnRight methodsFor: 'instance creation' stamp: 'AT 5/30/2022 13:02:38'!
initialize
	directionsAfterTurning := Dictionary new.
	directionsAfterTurning at: 'N' put: 'E'.
	directionsAfterTurning at: 'E' put: 'S'.
	directionsAfterTurning at: 'S' put: 'O'.
	directionsAfterTurning at: 'O' put: 'N'.
	
	! !


!classDefinition: #MarsRoverUndefinedCommands category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverUndefinedCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverUndefinedCommands commentStamp: '<historical>' prior: 0!
I represent the idea of a command the Mars Rover will never understand, specifically a command that is not a string.!


!MarsRoverUndefinedCommands methodsFor: 'instance creation' stamp: 'IACS 5/31/2022 18:52:50'!
initialize! !


!MarsRoverUndefinedCommands methodsFor: 'validity' stamp: 'IACS 5/31/2022 18:54:30'!
confirmValidity
	self error: MarsRover invalidCommandException.! !

!MarsRoverUndefinedCommands methodsFor: 'validity' stamp: 'IACS 5/31/2022 18:45:47'!
thisCommandIsValid: aCommand
	^aCommand isString not.! !

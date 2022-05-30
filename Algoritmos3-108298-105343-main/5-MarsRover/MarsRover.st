!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRoverAtx69y69'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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

!MarsRover methodsFor: 'directioning' stamp: 'IACS 5/30/2022 12:03:00'!
receiveCommand: aCommand
	aCommand do: [ :aSubcommand | 
		| processedSubcommand |
		processedSubcommand := MarsRoverCommands processTheCommand: aSubcommand asString .
		processedSubcommand sendProtocolTo: self.].! !


!MarsRover methodsFor: 'private' stamp: 'IACS 5/29/2022 23:26:08'!
changeDirectionTo: aDirection
	directionPointingTo := aDirection.! !

!MarsRover methodsFor: 'private' stamp: 'IACS 5/29/2022 23:54:09'!
changePositionByAdding: anAddend
	| currentPosition |
	currentPosition := position.
	position := currentPosition + anAddend.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 21:50:21'!
createAtPosition: aPosition PointingTo: aCardinalPoint 
	^self new initializeAtPosition: aPosition PointingTo: aCardinalPoint. ! !


!classDefinition: #MarsRoverCommands category: 'MarsRover'!
Object subclass: #MarsRoverCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverCommands commentStamp: '<historical>' prior: 0!
I represent all possible commands that a Mars Rover can understand. My instances define the protocol the Mars Rover executes after processing a command.!


!MarsRoverCommands methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 23:04:46'!
initialize
	self subclassResponsibility .! !


!MarsRoverCommands methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:18:44'!
sendProtocolTo: aMarsRover
	self subclassResponsibility .																									! !

!MarsRoverCommands methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:07:55'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommands class' category: 'MarsRover'!
MarsRoverCommands class
	instanceVariableNames: ''!

!MarsRoverCommands class methodsFor: 'instance creation' stamp: 'IACS 5/30/2022 12:16:05'!
processTheCommand: aReceivedCommand
	| receivedCommand |
	receivedCommand := self allSubclasses detect: [ :aSubclass | aSubclass new thisIsTheCorrectCommandAfterReceiving: aReceivedCommand].
	^receivedCommand new.! !


!classDefinition: #MarsRoverMoveCommands category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverMoveCommands
	instanceVariableNames: 'coordinateTranslationsToDo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverMoveCommands methodsFor: 'command selection' stamp: 'IACS 5/30/2022 12:14:42'!
sendProtocolTo: aMarsRover
	self subclassResponsibility.! !

!MarsRoverMoveCommands methodsFor: 'command selection' stamp: 'IACS 5/30/2022 12:14:57'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^false.! !


!MarsRoverMoveCommands methodsFor: 'instance creation' stamp: 'IACS 5/30/2022 12:24:19'!
initialize
	coordinateTranslationsToDo := Dictionary new.
	coordinateTranslationsToDo at: 'N' put: (0@1).
	coordinateTranslationsToDo at: 'O' put: (-1@0).
	coordinateTranslationsToDo at: 'S' put: (0@-1).
	coordinateTranslationsToDo at: 'E' put: (1@0).
	
	! !


!classDefinition: #MarsRoverMoveBackwards category: 'MarsRover'!
MarsRoverMoveCommands subclass: #MarsRoverMoveBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverMoveBackwards commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for moving backwards.!


!MarsRoverMoveBackwards methodsFor: 'command selection' stamp: 'IACS 5/30/2022 12:24:19'!
sendProtocolTo: aMarsRover
	| addend |
	addend := coordinateTranslationsToDo at: aMarsRover direction.							
	aMarsRover changePositionByAdding: (addend*(-1)).! !

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


!MarsRoverMoveForward methodsFor: 'command selection' stamp: 'IACS 5/30/2022 12:24:19'!
sendProtocolTo: aMarsRover
	| addend |
	addend := coordinateTranslationsToDo at: aMarsRover direction.							
	aMarsRover changePositionByAdding: addend.! !

!MarsRoverMoveForward methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:44:40'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'f'.! !


!classDefinition: #MarsRoverTurnLeft category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverTurnLeft
	instanceVariableNames: 'directionsAfterTurningLeft'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverTurnLeft commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for turning left by 90 degrees!


!MarsRoverTurnLeft methodsFor: 'command selection' stamp: 'IACS 5/30/2022 12:26:21'!
sendProtocolTo: aMarsRover
	| directionAfterTurningLeft |
	directionAfterTurningLeft := directionsAfterTurningLeft at: aMarsRover direction.							
	aMarsRover changeDirectionTo: directionAfterTurningLeft.! !

!MarsRoverTurnLeft methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:07:41'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'l'.! !


!MarsRoverTurnLeft methodsFor: 'instance creation' stamp: 'IACS 5/30/2022 12:26:21'!
initialize
	directionsAfterTurningLeft := Dictionary new.
	directionsAfterTurningLeft at: 'N' put: 'O'.
	directionsAfterTurningLeft at: 'O' put: 'S'.
	directionsAfterTurningLeft at: 'S' put: 'E'.
	directionsAfterTurningLeft at: 'E' put: 'N'.
	
	! !


!classDefinition: #MarsRoverTurnRight category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverTurnRight
	instanceVariableNames: 'directionsAfterTurningRight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverTurnRight commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for turning right by 90 degrees!


!MarsRoverTurnRight methodsFor: 'command selection' stamp: 'IACS 5/30/2022 12:26:36'!
sendProtocolTo: aMarsRover
	| directionAfterTurningRight |
	directionAfterTurningRight := directionsAfterTurningRight at: aMarsRover direction.							
	aMarsRover changeDirectionTo: directionAfterTurningRight.! !

!MarsRoverTurnRight methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:08:18'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'r'.! !


!MarsRoverTurnRight methodsFor: 'instance creation' stamp: 'IACS 5/30/2022 12:26:36'!
initialize
	directionsAfterTurningRight := Dictionary new.
	directionsAfterTurningRight at: 'N' put: 'E'.
	directionsAfterTurningRight at: 'E' put: 'S'.
	directionsAfterTurningRight at: 'S' put: 'O'.
	directionsAfterTurningRight at: 'O' put: 'N'.
	
	! !

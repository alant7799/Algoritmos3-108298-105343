!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/29/2022 21:53:04'!
test01AMarsRoverCanBeCreatedAtASpecificPositionPointingToASpecificDirection
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	self assert: marsRover position = (69@69). 
	self assert: marsRover direction = 'N'.
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:23:17'!
test02TheDirectionTheMarsRoverIsPointingToCanBeCommandedToChange
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'l'.
	self assert: marsRover direction = 'O'.! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:23:21'!
test03TheDirectionTheMarsRoverIsPointingToCanBeCommandedToChangeSuccesively
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'l'.
	marsRover receiveCommand: 'l'.
	self assert: marsRover direction = 'S'.! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:23:27'!
test04TheDirectionCanBeChangedInMultipleDirections
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'l'.
	marsRover receiveCommand: 'r'.
	marsRover receiveCommand: 'r'.
	self assert: marsRover direction = 'E'.! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:23:33'!
test05MarsRoverCanMoveForward
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'f'.
	self assert: marsRover position = (69@70).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:23:41'!
test06MarsRoverCanMoveForwardSuccesively
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'f'.
	marsRover receiveCommand: 'f'.
	marsRover receiveCommand: 'f'.
	marsRover receiveCommand: 'f'.
	self assert: marsRover position = (69@73).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:23:52'!
test07MarsRoverCanMoveForwardAfterRotating
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'f'.
	marsRover receiveCommand: 'l'.
	marsRover receiveCommand: 'f'.
	marsRover receiveCommand: 'l'.
	marsRover receiveCommand: 'f'.
	self assert: marsRover position = (68@69).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:23:55'!
test08MarsRoverCanMoveBackwards
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'b'.
	self assert: marsRover position = (69@68).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:24:04'!
test09MarsRoverCanMoveForwardSuccesively
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'b'.
	marsRover receiveCommand: 'b'.
	marsRover receiveCommand: 'b'.
	self assert: marsRover position = (69@66).
	! !

!MarsRoverTests methodsFor: 'simple commands' stamp: 'IACS 5/30/2022 10:24:17'!
test10MarsRoverCanMoveBackwardsAfterRotating
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'b'.
	marsRover receiveCommand: 'l'.
	marsRover receiveCommand: 'b'.
	marsRover receiveCommand: 'l'.
	marsRover receiveCommand: 'b'.
	self assert: marsRover position = (70@69).
	! !


!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 11:47:43'!
test11MarsRoverCanMultipleCommandsOfMovingForwardFromASingleString
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'fffff'.
	self assert: marsRover position = (69@74).
	! !

!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 10:51:43'!
test12MarsRoverCanMultipleCommandsOfMovingBackwardsFromASingleString
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'bbb'.
	self assert: marsRover position = (69@66).
	! !

!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 12:04:11'!
test13MarsRoverCanUnderstandMultipleCommandsOfRotatingFromASingleString
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'llllrrrr'.
	self assert: marsRover position = (69@69).
	self assert: marsRover direction = 'N'.
	! !

!MarsRoverTests methodsFor: 'complex commands' stamp: 'IACS 5/30/2022 10:51:10'!
test14MarsRoverCanMultipleCommandsOfDifferentTypesFromOneString
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover receiveCommand: 'blblf'.
	self assert: marsRover position = (70@67).
	! !



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

!MarsRoverCommands class methodsFor: 'instance creation' stamp: 'IACS 5/30/2022 11:30:34'!
processTheCommand: aReceivedCommand
	| receivedCommand possibleCommands |
	possibleCommands := self subclasses collect: [ :aSubclass | aSubclass new ].
	receivedCommand := possibleCommands detect: [ :aCommand | aCommand thisIsTheCorrectCommandAfterReceiving: aReceivedCommand].
	^receivedCommand.! !


!classDefinition: #MarsRoverMoveBackwards category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverMoveBackwards
	instanceVariableNames: 'responsesToTheCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverMoveBackwards commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for moving backwards.!


!MarsRoverMoveBackwards methodsFor: 'instance creation' stamp: 'IACS 5/30/2022 00:04:39'!
initialize
	responsesToTheCommand := Dictionary new.
	responsesToTheCommand at: 'N' put: (0@-1).
	responsesToTheCommand at: 'O' put: (1@0).
	responsesToTheCommand at: 'S' put: (0@1).
	responsesToTheCommand at: 'E' put: (-1@0).
	
	! !


!MarsRoverMoveBackwards methodsFor: 'command selection' stamp: 'IACS 5/30/2022 00:04:49'!
sendProtocolTo: aMarsRover
	| addend |
	addend := responsesToTheCommand at: aMarsRover direction.							
	aMarsRover changePositionByAdding: addend.! !

!MarsRoverMoveBackwards methodsFor: 'command selection' stamp: 'IACS 5/30/2022 00:05:03'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'b'.! !


!classDefinition: #MarsRoverMoveForward category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverMoveForward
	instanceVariableNames: 'responsesToTheCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverMoveForward commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for moving forward!


!MarsRoverMoveForward methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 23:52:18'!
initialize
	responsesToTheCommand := Dictionary new.
	responsesToTheCommand at: 'N' put: (0@1).
	responsesToTheCommand at: 'O' put: (-1@0).
	responsesToTheCommand at: 'S' put: (0@-1).
	responsesToTheCommand at: 'E' put: (1@0).
	
	! !


!MarsRoverMoveForward methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:51:12'!
sendProtocolTo: aMarsRover
	| addend |
	addend := responsesToTheCommand at: aMarsRover direction.							
	aMarsRover changePositionByAdding: addend.! !

!MarsRoverMoveForward methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:44:40'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'f'.! !


!classDefinition: #MarsRoverTurnLeft category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverTurnLeft
	instanceVariableNames: 'responsesToTheCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverTurnLeft commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for turning left by 90 degrees!


!MarsRoverTurnLeft methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:24:54'!
sendProtocolTo: aMarsRover
	| directionAfterTurningLeft |
	directionAfterTurningLeft := responsesToTheCommand at: aMarsRover direction.							
	aMarsRover changeDirectionTo: directionAfterTurningLeft.! !

!MarsRoverTurnLeft methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:07:41'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'l'.! !


!MarsRoverTurnLeft methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 23:02:57'!
initialize
	responsesToTheCommand := Dictionary new.
	responsesToTheCommand at: 'N' put: 'O'.
	responsesToTheCommand at: 'O' put: 'S'.
	responsesToTheCommand at: 'S' put: 'E'.
	responsesToTheCommand at: 'E' put: 'N'.
	
	! !


!classDefinition: #MarsRoverTurnRight category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverTurnRight
	instanceVariableNames: 'responsesToTheCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
!MarsRoverTurnRight commentStamp: '<historical>' prior: 0!
I represent the Mars Rover command for turning right by 90 degrees!


!MarsRoverTurnRight methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:25:25'!
sendProtocolTo: aMarsRover
	| directionAfterTurningRight |
	directionAfterTurningRight := responsesToTheCommand at: aMarsRover direction.							
	aMarsRover changeDirectionTo: directionAfterTurningRight.! !

!MarsRoverTurnRight methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:08:18'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	^aCommand = 'r'.! !


!MarsRoverTurnRight methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 23:03:37'!
initialize
	responsesToTheCommand := Dictionary new.
	responsesToTheCommand at: 'N' put: 'E'.
	responsesToTheCommand at: 'E' put: 'S'.
	responsesToTheCommand at: 'S' put: 'O'.
	responsesToTheCommand at: 'O' put: 'N'.
	
	! !

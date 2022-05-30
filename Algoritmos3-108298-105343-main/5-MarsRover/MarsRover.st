!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 21:53:04'!
test01AMarsRoverCanBeCreatedAtASpecificPositionPointingToASpecificDirection
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	self assert: marsRover position = (69@69). 
	self assert: marsRover direction = 'N'.
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 21:59:02'!
test02TheDirectionTheMarsRoverIsPointingToCanBeCommandedToChange
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'l'.
	self assert: marsRover direction = 'O'.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 21:59:30'!
test03TheDirectionTheMarsRoverIsPointingToCanBeCommandedToChangeSuccesively
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'l'.
	marsRover sendCommand: 'l'.
	self assert: marsRover direction = 'S'.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 22:05:22'!
test04TheDirectionCanBeChangedInMultipleDirections
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'l'.
	marsRover sendCommand: 'r'.
	marsRover sendCommand: 'r'.
	self assert: marsRover direction = 'E'.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 23:55:01'!
test05MarsRoverCanMoveForward
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'f'.
	self assert: marsRover position = (69@70).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 23:55:38'!
test06MarsRoverCanMoveForwardSuccesively
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'f'.
	marsRover sendCommand: 'f'.
	marsRover sendCommand: 'f'.
	marsRover sendCommand: 'f'.
	self assert: marsRover position = (69@73).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 23:58:30'!
test07MarsRoverCanMoveForwardAfterRotating
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'f'.
	marsRover sendCommand: 'l'.
	marsRover sendCommand: 'f'.
	marsRover sendCommand: 'l'.
	marsRover sendCommand: 'f'.
	self assert: marsRover position = (68@69).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/29/2022 23:59:20'!
test08MarsRoverCanMoveBackwards
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'b'.
	self assert: marsRover position = (69@68).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/30/2022 00:02:06'!
test09MarsRoverCanMoveForwardSuccesively
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'b'.
	marsRover sendCommand: 'b'.
	marsRover sendCommand: 'b'.
	self assert: marsRover position = (69@66).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'IACS 5/30/2022 00:05:50'!
test10MarsRoverCanMoveBackwardsAfterRotating
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'b'.
	marsRover sendCommand: 'l'.
	marsRover sendCommand: 'b'.
	marsRover sendCommand: 'l'.
	marsRover sendCommand: 'b'.
	self assert: marsRover position = (70@69).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'AT 5/30/2022 11:09:51'!
test11MarsRoverCanRecibeAStringOfCommandsForMovinAhead
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'ffff'.
	self assert: marsRover position = (69@73).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'AT 5/30/2022 11:29:45'!
test12MarsRoverCanRecibeAStringOfRotationAndMoveCommands
	| marsRover |
	marsRover := MarsRover createAtPosition: (69@69) PointingTo: 'N'.
	marsRover sendCommand: 'frflb'.
	self assert: marsRover position = (70@69).
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position directionPointingTo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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

!MarsRover methodsFor: 'directioning' stamp: 'AT 5/30/2022 11:27:23'!
sendCommand: commands
	commands do: [:aCommand | (MarsRoverCommands createAfterReceving: (aCommand asString))  sendProtocolTo: self].! !


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

!MarsRoverCommands class methodsFor: 'as yet unclassified' stamp: 'IACS 5/29/2022 23:27:39'!
createAfterReceving: aSentCommand
	| receivedCommand |
	receivedCommand := self subclasses detect: [ :aSubclass | aSubclass new thisIsTheCorrectCommandAfterReceiving: aSentCommand].
	^receivedCommand new.! !

!MarsRoverCommands class methodsFor: 'as yet unclassified' stamp: 'IACS 5/29/2022 22:59:21'!
initialize
	self subclassResponsibility.! !


!classDefinition: #MarsRoverMoveBackwards category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverMoveBackwards
	instanceVariableNames: 'responsesToTheCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMoveForward class' category: 'MarsRover'!
MarsRoverMoveForward class
	instanceVariableNames: ''!

!MarsRoverMoveForward class methodsFor: 'as yet unclassified' stamp: 'IACS 5/29/2022 23:44:08'!
initialize
	^self new.! !


!classDefinition: #MarsRoverTurnLeft category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverTurnLeft
	instanceVariableNames: 'responsesToTheCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverTurnLeft class' category: 'MarsRover'!
MarsRoverTurnLeft class
	instanceVariableNames: ''!

!MarsRoverTurnLeft class methodsFor: 'as yet unclassified' stamp: 'IACS 5/29/2022 22:59:42'!
initialize
	^self new.! !


!classDefinition: #MarsRoverTurnRight category: 'MarsRover'!
MarsRoverCommands subclass: #MarsRoverTurnRight
	instanceVariableNames: 'responsesToTheCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverTurnRight class' category: 'MarsRover'!
MarsRoverTurnRight class
	instanceVariableNames: ''!

!MarsRoverTurnRight class methodsFor: 'as yet unclassified' stamp: 'IACS 5/29/2022 22:59:49'!
initialize
	^self new.! !

MarsRoverCommands initialize!
MarsRoverMoveForward initialize!
MarsRoverTurnLeft initialize!
MarsRoverTurnRight initialize!
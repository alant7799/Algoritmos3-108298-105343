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

!MarsRover methodsFor: 'directioning' stamp: 'IACS 5/29/2022 23:15:38'!
sendCommand: aCommand
	| processedCommand |
	((aCommand = 'l') or: (aCommand = 'r'))ifTrue: [processedCommand := MarsRoverRotationCommands createAfterReceving: aCommand].
	processedCommand sendProtocolTo: self.! !


!MarsRover methodsFor: 'private' stamp: 'IACS 5/29/2022 23:26:08'!
changeDirectionTo: aDirection
	directionPointingTo := aDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 21:50:21'!
createAtPosition: aPosition PointingTo: aCardinalPoint 
	^self new initializeAtPosition: aPosition PointingTo: aCardinalPoint. ! !


!classDefinition: #MarsRoverRotationCommands category: 'MarsRover'!
Object subclass: #MarsRoverRotationCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverRotationCommands methodsFor: 'initialize' stamp: 'IACS 5/29/2022 23:04:46'!
initialize
	self subclassResponsibility .! !


!MarsRoverRotationCommands methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:18:44'!
sendProtocolTo: aMarsRover
	self subclassResponsibility .																									! !

!MarsRoverRotationCommands methodsFor: 'command selection' stamp: 'IACS 5/29/2022 23:07:55'!
thisIsTheCorrectCommandAfterReceiving: aCommand
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverRotationCommands class' category: 'MarsRover'!
MarsRoverRotationCommands class
	instanceVariableNames: ''!

!MarsRoverRotationCommands class methodsFor: 'as yet unclassified' stamp: 'IACS 5/29/2022 23:27:39'!
createAfterReceving: aSentCommand
	| receivedCommand |
	receivedCommand := self subclasses detect: [ :aSubclass | aSubclass new thisIsTheCorrectCommandAfterReceiving: aSentCommand].
	^receivedCommand new.! !

!MarsRoverRotationCommands class methodsFor: 'as yet unclassified' stamp: 'IACS 5/29/2022 22:59:21'!
initialize
	self subclassResponsibility.! !


!classDefinition: #MarsRoverTurnLeft category: 'MarsRover'!
MarsRoverRotationCommands subclass: #MarsRoverTurnLeft
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
MarsRoverRotationCommands subclass: #MarsRoverTurnRight
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

MarsRoverRotationCommands initialize!
MarsRoverTurnLeft initialize!
MarsRoverTurnRight initialize!
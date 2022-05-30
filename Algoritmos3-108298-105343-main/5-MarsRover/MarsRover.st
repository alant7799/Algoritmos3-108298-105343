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

!MarsRover methodsFor: 'directioning' stamp: 'IACS 5/29/2022 22:06:33'!
sendCommand: aCommand 
	(aCommand = 'l')ifTrue:[self turnLeft.].
	(aCommand = 'r')ifTrue:[self turnRight.].! !

!MarsRover methodsFor: 'directioning' stamp: 'IACS 5/29/2022 22:13:36'!
turnLeft
	(directionPointingTo = 'N')ifTrue:[directionPointingTo := 'O']
	ifFalse:[(directionPointingTo = 'O')ifTrue:[directionPointingTo := 'S']
	ifFalse:[(directionPointingTo = 'S')ifTrue:[directionPointingTo := 'E']
	ifFalse:[(directionPointingTo = 'E')ifTrue:[directionPointingTo := 'N']]]].! !

!MarsRover methodsFor: 'directioning' stamp: 'IACS 5/29/2022 22:15:20'!
turnRight
	(directionPointingTo = 'N')ifTrue:[directionPointingTo := 'E']
	ifFalse:[(directionPointingTo = 'E')ifTrue:[directionPointingTo := 'S']
	ifFalse:[(directionPointingTo = 'S')ifTrue:[directionPointingTo := 'O']
	ifFalse:[(directionPointingTo = 'O')ifTrue:[directionPointingTo := 'N']]]].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'IACS 5/29/2022 21:50:21'!
createAtPosition: aPosition PointingTo: aCardinalPoint 
	^self new initializeAtPosition: aPosition PointingTo: aCardinalPoint. ! !

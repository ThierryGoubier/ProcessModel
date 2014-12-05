network
connectTo: aPort size: aMaxSize
	"There is an orientation, and a max size in the buffer. "

	| newPipe |
	self isOut
		ifFalse: [ ^ aPort connectTo: self ].
	(size isNil or: [ index notNil ])
		ifFalse: [ self error: 'Port "' , name , '" is an array of ports and should be accessed as "' , name , ' at: index"' ].
	(aPort size isNil or: [ aPort index notNil ])
		ifFalse: [ self error: 'Port "' , aPort name , '" is an array of ports and should be accessed as "' , aPort name , ' at: index"' ].
	self assert: self isOut.
	self assert: aPort isIn.
	self pipe: (newPipe := TauCFixedPipe from: self to: aPort size: aMaxSize).
	aPort pipe: newPipe.
	^ pipe
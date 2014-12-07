network
connectTo: aPort
	"Can be done in two ways."

	| newPipe |
	self isOut
		ifFalse: [ ^ aPort connectTo: self ].
	self isReadyForConnect
		ifFalse: [ self error: 'Port "' , name , '" is an array of ports and should be accessed as "' , name , ' at: index"' ].
	aPort isReadyForConnect
		ifFalse: [ self error: 'Port "' , aPort name , '" is an array of ports and should be accessed as "' , aPort name , ' at: index"' ].
	self assert: self isOut.
	self assert: aPort isIn.
	self pipe: (newPipe := TauCViewPipe from: self to: aPort).
	aPort pipe: newPipe.
	^ pipe
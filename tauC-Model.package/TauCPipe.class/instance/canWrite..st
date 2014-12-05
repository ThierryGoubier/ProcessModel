protocol
canWrite: aSize
	closed
		ifTrue: [ TauCException signal ].
	^ true
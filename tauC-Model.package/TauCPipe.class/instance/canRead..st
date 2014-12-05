protocol
canRead: aSize
	(closed and: [ buffer size < aSize ])
		ifTrue: [ TauCException signal ].
	^ (buffer size < aSize) not
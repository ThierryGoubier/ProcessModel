protocol
write: aCollection
	closed
		ifTrue: [ TauCException signal ].
	buffer addAll: aCollection
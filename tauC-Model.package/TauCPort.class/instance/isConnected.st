testing
isConnected
	size isNil
		ifTrue: [ ^ pipe notNil and: [ pipe isConnected ] ].
	pipe isNil
		ifTrue: [ ^ false ].
	pipe
		do: [ :each | 
			each isConnected
				ifFalse: [ ^ false ] ].
	^ true
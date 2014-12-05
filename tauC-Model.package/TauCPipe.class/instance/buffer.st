accessing
buffer
	buffer isNil
		ifTrue: [ buffer := OrderedCollection new ].
	^ buffer
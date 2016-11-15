accessing
pipe: aTauCPipe
	aTauCPipe isNil
		ifTrue: [ self size
				ifNil: [ pipe := nil ]
				ifNotNil: [ index
						ifNil: [ pipe := Array new: self size ]
						ifNotNil: [ pipe at: index put: nil ] ].
			^ nil ].
	self size isNil
		ifTrue: [ pipe
				ifNotNil: [ self error: 'Port "' , name , '" is already connected' ].
			pipe := aTauCPipe ]
		ifFalse: [ index
				ifNil: [ self
						error:
							'Port "' , name , '" is an array of ports and should be accessed as "'
								, name , ' at: index"' ].
			(pipe at: index)
				ifNotNil: [ self
						error: 'Port "' , name , '[' , index printString , ']" is already connected' ].
			pipe at: index put: aTauCPipe ]
accessing
at: anIndex
	size isNil
		ifTrue: [ 
			anIndex = 0
				ifFalse: [ self error: 'Trying to access port "' , name , '" with incorrect index' ].
			^ self ].
	^ self copy index: anIndex
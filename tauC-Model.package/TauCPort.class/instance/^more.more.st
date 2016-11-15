network
>> aPortOrArray
	"Can be done port to port, or array of ports to array of ports"

	| newPipe |
	self isOut
		ifFalse: [ ^ aPortOrArray >> self ].
	self isReadyForConnect
		ifFalse: [ aPortOrArray size = self size
				ifFalse: [ self error: 'Wrong number of ports to connect to' ].
			^ (1 to: size)
				collect: [ :i | (self at: i) >> (aPortOrArray at: i) ] ].	"Array case"
	aPortOrArray isReadyForConnect
		ifFalse: [ self
				error:
					'Port "' , aPortOrArray name
						, '" is an array of ports and should be accessed as "'
						, aPortOrArray name , ' at: index"' ].
	self assert: aPortOrArray isIn.
	self pipe: (newPipe := TauCViewPipe from: self to: aPortOrArray).
	aPortOrArray pipe: newPipe.
	^ self pipe
initialize-release
in: anArrayOfPorts
	"Add all those symbolic ports as in ports. "

	anArrayOfPorts isSymbol
		ifTrue: [ 
			self addPort: (TauCInPort named: anArrayOfPorts on: self).
			^ self ].
	anArrayOfPorts
		do: [ :each | 
			each isArray
				ifTrue: [ self addPort: (TauCInPort new: each second named: each first on: self) ]
				ifFalse: [ self addPort: (TauCInPort named: each on: self) ] ]
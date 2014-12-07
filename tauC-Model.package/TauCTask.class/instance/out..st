initialize-release
out: anArrayOfPorts
	"Add all those symbolic ports as in ports. "

	anArrayOfPorts isSymbol
		ifTrue: [ 
			self addPort: (TauCOutPort named: anArrayOfPorts on: self).
			^ self ].
	anArrayOfPorts
		do: [ :each | 
			each isArray
				ifTrue: [ self addPort: (TauCOutPort new: each second named: each first on: self) ]
				ifFalse: [ self addPort: (TauCOutPort named: each on: self) ] ]
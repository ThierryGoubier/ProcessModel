*tauc-model
>> aPortOrArray
	aPortOrArray size = self size
		ifFalse: [ ^ self error: 'Ports or collections should be of the same size' ].
	^ (1 to: self size)
		collect: [ :i | (self at: i) >> (aPortOrArray at: i) ]
*tauc-model
>> aPortOrArray
	aPortOrArray size = self size
		ifFalse: [ ^ self error: 'Ports or collections should be of the same size' ].
	self with: aPortOrArray do: [ :l :r | l >> r ]
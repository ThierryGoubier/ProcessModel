testing
fullyConnected
	processes
		do: [ :each | 
			each fullyConnected
				ifFalse: [ ^ false ] ].
	^ true
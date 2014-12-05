testing
fullyConnected
	ports
		do: [ :each | 
			each isConnected
				ifFalse: [ false ] ].
	^ true
execution
next: aStateName with: arg
	| stateSpec |
	stateSpec := stateFunctions at: aStateName.
	nextState := Array
		with: stateSpec first
		with: (Array with: arg)
		with: stateSpec last
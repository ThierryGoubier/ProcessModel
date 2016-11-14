execution
next: aStateName with: arg1 with: arg2
	| stateSpec |
	stateSpec := stateFunctions at: aStateName.
	nextState := Array
		with: stateSpec first
		with: (Array with: arg1 with: arg2)
		with: stateSpec last
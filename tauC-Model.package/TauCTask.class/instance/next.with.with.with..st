execution
next: aStateName with: arg1 with: arg2 with: arg3
	| stateSpec |
	stateSpec := stateFunctions at: aStateName.
	nextState := Array
		with: stateSpec first
		with: (Array with: arg1 with: arg2 with: arg3)
		with: stateSpec last
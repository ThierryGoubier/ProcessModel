execution
next: aStateName withAll: args
	| stateSpec |
	stateSpec := stateFunctions at: aStateName.
	nextState := Array
		with: stateSpec first
		with: args
		with: stateSpec last
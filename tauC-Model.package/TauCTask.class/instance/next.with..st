execution
next: aStateName with: args
	| stateSpec |
	stateSpec := stateFunctions at: aStateName.
	nextState := {(stateSpec first).
	args.
	(stateSpec last)}
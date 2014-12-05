execution
next: aStateName
	| stateSpec |
	stateSpec := stateFunctions at: aStateName.
	nextState := {(stateSpec first).
	#().
	(stateSpec last)}
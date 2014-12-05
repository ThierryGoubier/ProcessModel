execution
runStep
	^ [ self step ]
		on: TauCException
		do: [ self exit ]
execution
step
	"Stepping over the processes! "

	| progress toExit |
	halt
		ifTrue: [ TauCException signal ].
	toExit := OrderedCollection new.
	progress := false.
	processes
		reverseDo: [ :aProcess | 
			progress := ([ aProcess runStep ]
				on: TauCExitNotification
				do: [ :ex | 
					toExit add: aProcess.
					true ]) or: [ progress ] ].
	toExit do: [ :aProcess | self exit: aProcess ].
	progress
		ifFalse: [ TauCException signal ]
execution
smallStep
	"Stepping over the processes, per process. Better for the GUI. Do not track if there is n progress."

	| progress toExit aProcess j |
	halt
		ifTrue: [ TauCException signal ].
	toExit := OrderedCollection new.
	progress := false.
	j := 0.
	[  progress not and: [ j < processes size ] ]
		whileTrue: [ 
			aProcess := processes removeFirst.
			progress := ([ aProcess runStep ]
				on: TauCExitNotification
				do: [ :ex | 
					toExit add: aProcess.
					true ]) or: [ progress ].
			processes add: aProcess.
			j := j + 1 ].
	toExit do: [ :each | self exit: each ].
	progress
		ifFalse: [ TauCException signal ]
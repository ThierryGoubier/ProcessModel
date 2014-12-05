execution
start: aProcess
	"A process has started (a task). "

	processes isNil
		ifTrue: [ processes := OrderedCollection new ].
	processes add: aProcess
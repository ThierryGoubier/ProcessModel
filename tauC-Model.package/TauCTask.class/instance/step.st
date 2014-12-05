execution
step
	"Step a task. As long as the next state cannot be executed yet, try to execute it. A state has a name, parameters and a list of data requirements on ports.
	The name refer to a block to execute.
	The arguments are given to the block
	The arguments are also used in the ports evaluation.
	The ports are : a port name, a port index (optional) and a size (optional?).
		Port index is a block with the arguments in parameters.
		Size can also have the arguments in parameters.
	There is maybe a way to hide that in pragmas."

	| iodata iodemands args exec |
	nextState isNil
		ifTrue: [ self next: #main ].
	exec := nextState first.
	args := nextState second "Test for validity. ".
	iodemands := nextState third
		collect: [ :p | 
			| port index size |
			port := self portNamed: p first.
			p second notNil
				ifTrue: [ index := p second valueWithArguments: args ]
				ifFalse: [ index := 0 ].
			size := p third valueWithArguments: args.
			{port.
			index.
			size} ] "Check that we can read the data. ".
	iodemands
		do: [ :e | 
			e first isIn
				ifTrue: [ 
					((e first at: e second) canRead: e third)
						ifFalse: [ ^ false ] ].
			e first isOut
				ifTrue: [ 
					((e first at: e second) canWrite: e third)
						ifFalse: [ ^ false ] ] ] "Read the data. ".
	iodata := iodemands
		collect: [ :e | 
			| d |
			d := Array new: e third.
			e first isIn
				ifTrue: [ (e first at: e second) read: d ].
			d ] "Execute the state. ".
	exec valueWithArguments: args , iodata "Write back the data. ".
	iodemands
		with: iodata
		do: [ :port :data | 
			port first isOut
				ifTrue: [ (port first at: port second) write: data ] ].
	^ true
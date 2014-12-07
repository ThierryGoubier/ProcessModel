testing
testSplit2
	"Test a split with two readers, but splitting by 2."

	| s split sender reader1 reader2 |
	s := TauCSystem new.
	split := TauCSplit new: 2 step: 2 in: s.
	sender := TauCTask
		named: 'sender'
		out: #(#send)
		state:
			{{#main.
			[ :send | 
			send
				at: 1 put: 5;
				at: 2 put: 6.
			Transcript
				show: 'Send 5 6';
				cr ].
			{{#send.
			nil.
			2}}}}
		world: s.
	reader1 := TauCTask
		named: 'reader1'
		in: #read
		state:
			{{#main.
			[ :read | 
			Transcript
				show: 'Reader1 received ' , read first printString;
				cr ].
			{{#read.
			nil.
			1}}}}
		world: s.
	reader2 := TauCTask
		named: 'reader2'
		in: #read
		state:
			{{#main.
			[ :read | 
			Transcript
				show: 'Reader2 received ' , read first printString;
				cr ].
			{{#read.
			nil.
			1}}}}
		world: s.
	(sender portNamed: #send) connectTo: (split portNamed: #input).
	((split portNamed: #output) at: 1) connectTo: (reader1 portNamed: #read).
	((split portNamed: #output) at: 2) connectTo: (reader2 portNamed: #read).
	s fullyConnected.
	6 timesRepeat: [ s step ]
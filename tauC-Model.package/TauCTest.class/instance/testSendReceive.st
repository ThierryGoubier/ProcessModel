testing
testSendReceive
	"Test a very simple send receive. "

	| s sender reader |
	s := TauCSystem new.
	sender := TauCTask
		in: #()
		out: #(#send)
		state:
			{{#main.
			[ :send | send at: 1 put: 5. Transcript show: 'Send 5'; cr ].
			{{#send. nil. 1}}}}
		world: s.
	reader := TauCTask
		in: #(read)
		out: #()
		state:
			{{#main.
			[ :read | Transcript show: 'Received ', read first printString; cr ].
			{{#read. nil. 1}}}}
		world: s.
	(sender portNamed: #send) connectTo: (reader portNamed: #read ).
	s fullyConnected.
	s step.
	s step
	
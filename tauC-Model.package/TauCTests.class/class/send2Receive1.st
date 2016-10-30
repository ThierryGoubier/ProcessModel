examples
send2Receive1
	"A very simple send receive. "

	"TauCTest send2Receive1"

	<example>
	| s sender reader |
	s := TauCSystem new.
	sender := TauCTask
		named: 'sender'
		out: #(#send)
		state:
			{{#main.
			[ :send | 
			send
				at: 1 put: 5;
				at: 2 put: 6.
			'Send 5 6' logCr ].
			#(#(#send 2))}}
		world: s.
	reader := TauCTask
		named: 'reader'
		in: #(#read)
		state:
			{{#main.
			[ :read | ('Received ' , read first printString) logCr ].
			#(#read)}}
		world: s.
	(sender portNamed: #send) connectTo: (reader portNamed: #read).
	s fullyConnected.
	s step.
	s exploreInRoassal
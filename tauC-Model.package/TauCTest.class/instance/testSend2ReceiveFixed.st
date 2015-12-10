testing
testSend2ReceiveFixed
	"Test a very simple send receive. "

	"TauCTest new testSend2ReceiveFixed"

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
	(sender portNamed: #send) connectTo: (reader portNamed: #read) size: 4.
	s fullyConnected.
	s step.
	s exploreInRoassal
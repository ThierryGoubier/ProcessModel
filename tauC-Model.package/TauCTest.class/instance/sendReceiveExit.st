examples
sendReceiveExit
	"A very simple send receive, with the sender exiting."

	"TauCTest new sendReceiveExit"

	<example>
	| s sender reader |
	s := TauCSystem new.
	sender := TauCTask
		named: 'sender'
		out: #send
		state:
			{{#main.
			[ :send | 
			send
				at: 1 put: 5;
				at: 2 put: 6;
				at: 3 put: 7.
			Transcript
				show: 'Send 5 6 7';
				cr.
			sender next: #exit ].
			{{#send . nil . 3}}}}
		world: s.
	reader := TauCTask
		named: 'reader'
		in: #read
		state:
			{{#main.
			[ :read | 
			Transcript
				show: 'Received ' , read first printString;
				cr ].
			{{#read . nil . 1}}}}
		world: s.
	(sender portNamed: #send) connectTo: (reader portNamed: #read).
	s fullyConnected.
	s exploreInRoassal
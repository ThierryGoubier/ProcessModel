examples
send2Receive2Exit
	"A very simple send receive, with an exit."

	"TauCTest new testSend2Receive2Exit"

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
				at: 2 put: 6.
			Transcript
				show: 'Send 5 6';
				cr.
			sender next: #exit ].
			{{#send . nil . 2}}}}
		world: s.
	reader := TauCTask
		named: 'reader'
		in: #read
		state:
			{{#main.
			[ :read | 
			Transcript
				show: 'Received ' , read first printString , ' ' , read second printString;
				cr ].
			{{#read . nil . 2}}}}
		world: s.
	(sender portNamed: #send) connectTo: (reader portNamed: #read).
	s fullyConnected.
	s exploreInRoassal
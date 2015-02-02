testing
testSendIdentityReceiveMemory
	"Test a send -> transmit -> receive with a sender which has a memory. "

	| s sender transmit reader |
	s := TauCSystem new.
	sender := TauCTask
		named: 'sender'
		out: #send
		state:
			{{#main.
			[ :i :send | 
			send at: 1 put: i.
			Transcript
				show: 'Send ' , i printString;
				cr.
			i < 3
				ifTrue: [ sender next: #main with: {(i + 1)} ]
				ifFalse: [ sender next: #exit ] ].
			#(#send)}}
		world: s.
	sender next: #main with: #(0).
	transmit := TauCTask
		named: 'transmit'
		in: #read
		out: #send
		state:
			{{#main.
			[ :send :read | 
			send at: 1 put: read first.
			Transcript
				show: 'Transmitted ' , read first printString;
				cr ].
			#(#(#send) #read)}}
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
			#(#read)}}
		world: s.
	(sender portNamed: #send) connectTo: (transmit portNamed: #read).
	(transmit portNamed: #send) connectTo: (reader portNamed: #read).
	s fullyConnected.
	s exploreInRoassal
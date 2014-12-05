testing
testSendReceiveExit
	"Test a very simple send receive. "

	| s sender reader |
	s := TauCSystem new.
	sender := TauCTask new
		addOut: #send;
		for: #main
			do: [ :send | 
					send
						at: 1 put: 5;
						at: 2 put: 6;
						at: 3 put: 7.
					Transcript
						show: 'Send 5 6 7';
						cr.
					sender next: #exit ]
			io:
				{{#send.
				nil.
				3}};
		world: s.
	reader := TauCTask
		in: #(#read)
		out: #()
		state:
			{{#main.
			[ :read | 
			Transcript
				show: 'Received ' , read first printString;
				cr ].
			{{#read.
			nil.
			1}}}}
		world: s.
	(sender portNamed: #send) connectTo: (reader portNamed: #read).
	s fullyConnected.
	4 timesRepeat: [ s step ]
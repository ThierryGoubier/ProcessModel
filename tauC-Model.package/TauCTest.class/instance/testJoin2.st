testing
testJoin2
	"Test a join (step 2) with two senders and one reader. "

	| s join sender1 sender2 reader |
	s := TauCSystem new.
	join := TauCJoin new: 2 step: 2 in: s.
	sender1 := TauCTask new
		addOut: #send;
		for: #main
			do: [ :send | 
					send at: 1 put: 5.
					Transcript
						show: 'S1 send 5';
						cr ]
			io:
				{{#send.
				nil.
				1}};
		world: s.
	sender2 := TauCTask new
		addOut: #send;
		for: #main
			do: [ :send | 
					send at: 1 put: 6.
					Transcript
						show: 'S2 send 6';
						cr ]
			io:
				{{#send.
				nil.
				1}};
		world: s.
	reader := TauCTask new
		addIn: #read;
		for: #main
			do: [ :read | 
					Transcript
						show: 'Reader received ' , read first printString , ' ' , read second printString;
						cr ]
			io:
				{{#read.
				nil.
				2}};
		world: s.
	(sender1 portNamed: #send) connectTo: ((join portNamed: #input) at: 1).
	(sender2 portNamed: #send) connectTo: ((join portNamed: #input) at: 2).
	(join portNamed: #output) connectTo: (reader portNamed: #read).
	s fullyConnected.
	6 timesRepeat: [ s step ]
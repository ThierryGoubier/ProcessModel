examples
join2
	"Join (step 2) with two senders and one reader. "

	"TauCTest join2"

	<example>
	| s join sender1 sender2 reader |
	s := TauCSystem new.
	join := TauCJoin new: 2 step: 2 in: s.
	sender1 := TauCTask
		named: 'sender1'
		out: #send
		state:
			{{#main.
			[ :send | 
			send at: 1 put: 5.
			Transcript
				show: 'S1 send 5';
				cr ].
			#(#send)}}
		world: s.
	sender2 := TauCTask
		named: 'sender2'
		out: #send
		state:
			{{#main.
			[ :send | 
			send at: 1 put: 6.
			Transcript
				show: 'S2 send 6';
				cr ].
			#(#send)}}
		world: s.
	reader := TauCTask
		named: 'reader'
		in: #read
		state:
			{{#main.
			[ :read | 
			Transcript
				show:
					'Reader received ' , read first printString , ' '
						, read second printString;
				cr ].
			#(#(#read 2))}}
		world: s.
	(sender1 portNamed: #send)
		connectTo: ((join portNamed: #input) at: 1).
	(sender2 portNamed: #send)
		connectTo: ((join portNamed: #input) at: 2).
	(join portNamed: #output) connectTo: (reader portNamed: #read).
	s fullyConnected.
	s exploreInRoassal
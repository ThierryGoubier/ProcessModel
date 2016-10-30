examples
join
	"Test a join with two senders and one reader. "
	<example>
	"TauCTest join"
	
	| s join sender1 sender2 reader |
	s := TauCSystem new.
	join := TauCJoin new: 2 in: s.
	sender1 := TauCTask
		named: 'sender1'
		out: #send
		state:
			{{#main.
			[ :send | 
			send at: 1 put: 5.
			'S1 send 5' logCr ].
			#(#send)}}
		world: s.
	sender2 := TauCTask
		named: 'sender2'
		out: #send
		state:
			{{#main.
			[ :send | 
			send at: 1 put: 6.
			'S2 send 6' logCr ].
			#(#send)}}
		world: s.
	reader := TauCTask
		named: 'reader'
		in: #read
		state:
			{{#main.
			[ :read | ('Reader received ' , read first printString , ' ' , read second printString) logCr ].
			#(#(#read 2))}}
		world: s.
	(sender1 portNamed: #send) connectTo: ((join portNamed: #input) at: 1).
	(sender2 portNamed: #send) connectTo: ((join portNamed: #input) at: 2).
	(join portNamed: #output) connectTo: (reader portNamed: #read).
	s fullyConnected.
	s exploreInRoassal.
	^ s
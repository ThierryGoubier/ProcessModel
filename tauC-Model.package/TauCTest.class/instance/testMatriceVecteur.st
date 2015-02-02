testing
testMatriceVecteur
	"Test a join with two senders and one reader. "

	| s join mac sender1 sender2 reader |
	s := TauCSystem new.
	join := TauCJoin new: 2 in: s.
	mac := TauCTask
		named: 'mac'
		in: #(#yin #xin #a)
		out: #(#xout #yout)
		state:
			{{#main.
			[ :yin :xin :a :xout :yout | yout at: 1 put: [ (yin first + xin first) * a first ] ].
			#(#yin #xin #a #xout #yout)}}
		world: s.
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
				show: 'Reader received ' , read first printString , ' ' , read second printString;
				cr ].
			#(#read)}}
		world: s.
	(sender1 portNamed: #send) connectTo: ((join portNamed: #input) at: 1).
	(sender2 portNamed: #send) connectTo: ((join portNamed: #input) at: 2).
	(join portNamed: #output) connectTo: (reader portNamed: #read).
	s fullyConnected.
	s exploreInRoassal.
	^ s
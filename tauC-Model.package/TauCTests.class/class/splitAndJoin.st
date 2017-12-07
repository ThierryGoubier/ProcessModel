examples
splitAndJoin
	"Test a split followed by a join. "

	"TauCTest splitAndJoin"

	<example>
	| s join sender split reader |
	s := TauCSystem new.
	join := s newJoin: 2.
	split := s newSplit1to: 2.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send at: 1 put: 5.
			'S1 send 5' logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #(#read 2)
			do: [ :read | 
			('Reader received ' , read first printString , ' '
				, read second printString) logCr ].
	sender send >> split input.
	split output >> join input.
	join output >> reader read.
	s fullyConnected.
	s exploreInRoassal.
	^ s
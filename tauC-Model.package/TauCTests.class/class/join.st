examples
join
	"Test a join with two senders and one reader. "

	"TauCTest join"

	<example>
	| s join sender1 sender2 reader |
	s := TauCSystem new.
	join := s newJoin: 2.
	sender1 := (s newTask: 'sender1')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send at: 1 put: 5.
			'S1 send 5' logCr ].
	sender2 := (s newTask: 'sender2')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send at: 1 put: 6.
			'S2 send 6' logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #(#read 2)
			do: [ :read | 
			('Reader received ' , read first printString , ' '
				, read second printString) logCr ].
	{sender1 send.
	sender2 send} >> join input.
	join output >> reader read.
	s fullyConnected.
	s exploreInRoassal.
	^ s
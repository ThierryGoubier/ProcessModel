tests-api
testSimpleJoinWithArrayConnect
	"A version with an array connect."

	| s join sender1 sender2 reader |
	s := TauCSystem new.
	join := s newJoin: 2.
	sender1 := (s newTask: 'sender1')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send at: 1 put: 5.
			'Sender1 >> 5' logCr ].
	sender2 := (s newTask: 'sender2')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send at: 1 put: 6.
			'Sender2 >> 6' logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #(#read 2)
			do: [ :read | ('Reader received ' , read first printString) logCr ].
	{sender1 send.
	sender2 send} >> join input.
	join output >> reader read.
	s fullyConnected.
	s exploreInRoassal
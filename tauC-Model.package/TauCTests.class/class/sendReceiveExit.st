examples
sendReceiveExit
	"A very simple send receive, with the sender exiting."

	"TauCTest sendReceiveExit"

	<example>
	| s sender reader |
	s := TauCSystem new.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send
				at: 1 put: 5;
				at: 2 put: 6;
				at: 3 put: 7.
			'Send 5 6 7' logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #read
			do: [ :read | ('Received ' , read first printString) logCr ].
	sender send >> reader read.
	s fullyConnected.
	s exploreInRoassal
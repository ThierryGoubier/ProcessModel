tests-api
testSimpleSendReceive
	"Concise syntax for simple tasks."

	| s sender reader |
	s := TauCSystem new.
	s := TauCSystem new.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send at: 1 put: 5.
			'Send 5' logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #read
			do: [ :read | ('Received ' , read first printString) logCr ].
	sender send >> reader read.
	s fullyConnected.
	s exploreInRoassal
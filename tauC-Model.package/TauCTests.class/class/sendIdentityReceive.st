examples
sendIdentityReceive
	"A send -> transmit -> receive. "

	"TauCTest sendIdentityReceive"

	<example>
	| s sender transmit reader |
	s := TauCSystem new.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #send
			do: [ :send | 
			send at: 1 put: 5.
			'Send 5' logCr ].
	transmit := (s newTask: 'transmit')
		out: #send;
		in: #read;
		state: #main -> #(send read)
			do: [ :send :read | 
			send at: 1 put: read first.
			('Transmitted ' , read first printString) logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #read
			do: [ :read | ('Received ' , read first printString) logCr ].
	sender send >> transmit read.
	transmit send >> reader read.
	s fullyConnected.
	s exploreInRoassal
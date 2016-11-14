examples
send2ReceiveFixed
	"A sender, a receiver, and a fifo with a fixed size."

	"TauCTest send2Receive2Fixed"

	<example>
	| s sender reader |
	s := TauCSystem new.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #(#send 2)
			do: [ :send | 
			send
				at: 1 put: 5;
				at: 2 put: 6.
			'Send 5 6' logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #read
			do: [ :read | ('Received ' , read first printString) logCr ].
	sender send >> reader read size: 4.
	s fullyConnected.
	s step.
	s exploreInRoassal
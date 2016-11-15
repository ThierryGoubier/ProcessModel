examples
send2Receive2Exit
	"A very simple send receive, with an exit."

	"TauCTest testSend2Receive2Exit"

	<example>
	| s sender reader |
	s := TauCSystem new.
	sender := s newTask: 'sender'.
	sender
		out: #send;
		state: #main -> #(#send 2)
			do: [ :send | 
			send
				at: 1 put: 5;
				at: 2 put: 6.
			'Send 5 6' logCr.
			sender next: #exit ].
	reader := s newTask: 'reader'.
	reader
		in: #read;
		state: #main -> #(#read 2)
			do: [ :read | 
			('Received ' , read first printString , ' ' , read second printString)
				logCr ].
	sender send >> reader read.
	s fullyConnected.
	s exploreInRoassal
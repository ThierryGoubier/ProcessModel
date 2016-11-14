examples
sendIdentityReceiveMemory
	"A send -> transmit -> receive with a sender which has a memory. "

	"TauCTest new sendIdentityReceiveMemory"

	<example>
	| s sender transmit reader |
	s := TauCSystem new.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #send
			do: [ :i :send | 
			send at: 1 put: i.
			('Send ' , i printString) logCr.
			i < 3
				ifTrue: [ sender next: #main with: i + 1 ]
				ifFalse: [ sender next: #exit ] ].
	sender next: #main with: 0.
	transmit := (s newTask: 'transmit')
		in: #read;
		out: #send;
		state: #main -> #(#send #read)
			do: [ :send :read | 
			send at: 1 put: read first.
			('Transmitted ' , read first printString) logCr ].
	reader := (s newTask: 'reader')
		in: #read;
		state: #main -> #read
			do: [ :read | ('Received ' , read printString) logCr ].
	sender send >> transmit read.
	transmit send >> reader read.
	s fullyConnected.
	s exploreInRoassal
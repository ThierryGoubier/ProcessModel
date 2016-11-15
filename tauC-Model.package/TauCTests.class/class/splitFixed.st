examples
splitFixed
	"A split with two readers, and one fifo constrained to 2."

	"TauCTest splitFixed"

	<example>
	| s split sender reader1 reader2 |
	s := TauCSystem new.
	split := s newSplit1to: 2.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #(send 2)
			do: [ :send | 
			send
				at: 1 put: 5;
				at: 2 put: 6.
			'Send 5 6' logCr ].
	reader1 := (s newTask: 'reader1')
		in: #read;
		state: #main -> #read
			do: [ :read | ('Reader1 received ' , read first printString) logCr ].
	reader2 := (s newTask: 'reader2')
		in: #read;
		state: #main -> #read
			do:
				[ :read | ('Reader2 received ' , read first printString) logCr ].
	sender send >> split input size: 2.
	split output
		>>
			{reader1 read.
			reader2 read}.
	s fullyConnected.
	s exploreInRoassal
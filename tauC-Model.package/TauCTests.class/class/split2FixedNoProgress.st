examples
split2FixedNoProgress
	"A split with two readers, reading by 2."

	"TauCTest split2FixedNoProgress"

	<example>
	| s split sender reader1 reader2 |
	s := TauCSystem new.
	split := s newSplit1to: 2 by: 2.
	sender := (s newTask: 'sender')
		out: #send;
		state: #main -> #(#send 2)
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
			do: [ :read | ('Reader2 received ' , read first printString) logCr ].
	sender send >> split input size: 2.
	split output first >> reader1 read size: 1.
	split output second >> reader2 read size: 1.
	s fullyConnected.
	s exploreInRoassal
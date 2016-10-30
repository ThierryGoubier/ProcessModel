tests-api
testSimpleSplit
	"A split with two readers, fluent interface. "

	| s split sender reader1 reader2 |
	s := TauCSystem new.
	split := s newSplit1to: 2.
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
			do: [ :read | 
			Transcript
				show: 'Reader2 received ' , read first printString;
				cr ].
	sender send >> split input.
	(split output at: 1) >> reader1 read.
	(split output at: 2) >> reader2 read.
	s fullyConnected.
	s exploreInRoassal
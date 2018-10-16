initialize-release
size: aSize
	self
		in: #(#input);
		out:
			{{#output.
			aSize}};
		state:
			{{#main.
			[ :i :in :out | 
			out at: 1 put: (in at: 1).
			self next: #main with: {(i % aSize + 1)} ].
			{{#input . nil . 1}.
			{#output.
			[ :i | i ].
			1}}}}.
	self next: #main with: #(1)
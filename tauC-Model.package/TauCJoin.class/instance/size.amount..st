initialize-release
size: aSize amount: anAmount
	size := aSize.
	self
		in:
				{{#input.
					size}};
		out: {#output};
		state:
				{{#main.
					[ :i :in :out | 
					1 to: anAmount do: [ :k | out at: k put: (in at: k) ].
					self next: #main with: {(i % size + 1)} ].
					{{#input.
					[ :i | i ].
					anAmount}.
					{#output.
					nil.
					anAmount}}}}.
	self next: #main with: #(1)
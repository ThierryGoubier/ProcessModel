initialize-release
size: aSize
	size := aSize.
	self
		in: {{#input. size}};
		out: {#output};
		state:
				{{#main.
					[ :i :in :out | 
					out at: 1 put: (in at: 1).
					self next: #main with: {(i % size + 1)} ].
					{{#input.
					[:i | i].
					1}.
					{#output.
					nil.
					1}}}}.
	self next: #main with: #(1)
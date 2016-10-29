private
doesNotUnderstand: aMessage
	aMessage numArgs = 0
		ifTrue: [ self ports
				do: [ :p | 
					p name == aMessage selector
						ifTrue: [ ^ p ] ] ].
	^ super doesNotUnderstand: aMessage
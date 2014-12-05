protocol
close
	self pipe isArray
		ifTrue: [ self pipe do: [ :each | each close ] ]
		ifFalse: [ self pipe close ]
printing
printString
	""

	^ name ifNil: [ super printString ] ifNotNil: [ 'aTask(' , name , ')' ]
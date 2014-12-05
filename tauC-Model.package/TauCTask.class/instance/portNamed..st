accessing
portNamed: aName
	"Ensure that we have only one port of that name."

	| search |
	(search := ports select: [ :e | e name = aName ]) size == 1
		ifFalse: [ self error: 'Port "' , aName , '" is unknown' ].
	^ search asArray first
displaying
buildSlotsInView: aView
	"Show all slots on top of arrows."

	pipe isArray
		ifTrue: [ pipe do: [ :e | e buildSlotsInView: aView ] ]
		ifFalse: [ pipe buildSlotsInView: aView ]
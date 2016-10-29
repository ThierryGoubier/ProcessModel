initialize-release
state: aNameAndSpec do: aBlock
	"#name -> ports"

	| stateName exchange |
	stateName := aNameAndSpec key.
	exchange := OrderedCollection new.
	aNameAndSpec value isSymbol
		ifFalse: [ self error: 'not yet implemented' ]
		ifTrue: [ exchange add: (Array with: aNameAndSpec value with: nil with: 1) ].
	stateFunctions at: stateName put: (Array with: aBlock with: exchange)
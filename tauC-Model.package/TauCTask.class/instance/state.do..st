initialize-release
state: aNameAndSpec do: aBlock
	"#name -> ports"

	| stateName exchange v |
	stateName := aNameAndSpec key.
	v := aNameAndSpec value.
	exchange := OrderedCollection new.
	v isSymbol
		ifFalse: [ v first isSymbol
				ifFalse: [ self error: 'Not yet implemented' ]
				ifTrue: [ | p var amount |
					p := v first.
					var := v size > 2
						ifTrue: [ v second ]
						ifFalse: [  ].
					amount := v size > 1
						ifTrue: [ v last ]
						ifFalse: [ 1 ].
					exchange add: (Array with: p with: var with: amount) ] ]
		ifTrue: [ exchange add: (Array with: v with: nil with: 1) ].
	stateFunctions at: stateName put: (Array with: aBlock with: exchange)
initialize-release
state: aNameAndSpec do: aBlock
	"#name -> ports"

	| stateName exchange v |
	stateName := aNameAndSpec key.
	v := aNameAndSpec value.
	exchange := OrderedCollection new.
	v isSymbol
		ifFalse: [ v first isSymbol
				ifFalse: [ v
						do: [ :e | 
							| p var amount |
							p := e first.
							var := e size > 2
								ifTrue: [ e second ]
								ifFalse: [  ].
							amount := e size > 1
								ifTrue: [ e last ]
								ifFalse: [ 1 ].
							exchange add: (Array with: p with: var with: amount) ] ]
				ifTrue: [ | p var amount done |
					p := v first.
					done := true.
					[ v size > 1 and: [ self hasPortNamed: v second ] ]
						whileTrue: [ exchange add: (Array with: v first with: nil with: 1).
							p := v second.
							v := v allButFirst ].
					var := v size > 2
						ifTrue: [ v second ]
						ifFalse: [  ].
					amount := v size > 1
						ifTrue: [ v last ]
						ifFalse: [ 1 ].
					exchange add: (Array with: p with: var with: amount) ] ]
		ifTrue: [ exchange add: (Array with: v with: nil with: 1) ].
	stateFunctions at: stateName put: (Array with: aBlock with: exchange)
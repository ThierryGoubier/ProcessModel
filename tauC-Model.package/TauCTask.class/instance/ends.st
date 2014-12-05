accessing
ends
	^ OrderedCollection
		streamContents: [ :stream | 
			ports
				do: [ :aPort | 
					aPort pipe isArray
						ifTrue: [ stream nextPutAll: (aPort pipe collect: [ :aPipe | aPipe end component ]) ]
						ifFalse: [ stream nextPut: aPort pipe end component ] ] ]
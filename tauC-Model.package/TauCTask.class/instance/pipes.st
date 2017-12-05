accessing
pipes
	^ OrderedCollection
		streamContents: [ :stream | 
			ports
				do: [ :aPort | 
					aPort pipe isArray
						ifTrue: [ stream nextPutAll: aPort pipe ]
						ifFalse: [ stream nextPut: aPort pipe ] ] ]
accessing
inPipes
	^ OrderedCollection
		streamContents: [ :stream | 
			self inPorts
				do: [ :aPort | 
					aPort pipe isArray
						ifTrue: [ stream nextPutAll: aPort pipe ]
						ifFalse: [ stream nextPut: aPort pipe ] ] ]
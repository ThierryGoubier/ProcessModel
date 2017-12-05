accessing
outPipes
	^ OrderedCollection
		streamContents: [ :stream | 
			self outPorts
				do: [ :aPort | 
					aPort pipe isArray
						ifTrue: [ stream nextPutAll: aPort pipe ]
						ifFalse: [ stream nextPut: aPort pipe ] ] ]
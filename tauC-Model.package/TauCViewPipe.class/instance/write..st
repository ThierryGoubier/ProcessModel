protocol
write: aCollection
	closed
		ifTrue: [ TauCException signal ].
	view ifNotNil: [ buffer do: [ :each | (view elementFromModel: each) ifNotNil: [ :el | view removeElement: el ] ] ].
	buffer
		addAll:
			(aCollection
				collect: [ :e | 
					TauCSlot new
						slot: e;
						pipe: self ]).
	view ifNotNil: [ self rebuildSlots ]
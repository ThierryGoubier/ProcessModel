protocol
write: aCollection
	closed
		ifTrue: [ TauCException signal ].
	buffer
		addAll:
			(aCollection
				collect: [ :e | 
					TauCSlot new
						slot: e;
						pipe: self ])
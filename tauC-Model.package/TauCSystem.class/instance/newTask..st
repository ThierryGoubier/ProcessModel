building
newTask: aName
	^ TauCTask new
		world: self;
		named: aName
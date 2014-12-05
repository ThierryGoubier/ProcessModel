instance creation
new: aSize step: aQuantity in: aWorld
	^ self new
		size: aSize amount: aQuantity;
		world: aWorld
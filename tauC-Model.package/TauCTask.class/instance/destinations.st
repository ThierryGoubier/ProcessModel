accessing
destinations
	^ self ends reject: [ :each | each == self ]
accessing
destinations
	^ (ports collect: [ :each | each destination ]) reject: [ :each | each == self ]
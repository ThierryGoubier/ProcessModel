private
addPort: aPort
	"Add a port. Check if the name is in use or not."

	ports
		detect: [ :eachPort | eachPort name = aPort name ]
		ifNone: [ 
			ports add: aPort.
			^ self ].
	self error: 'Port "' , aPort name , '" already exist.'
private
checkPortName: aPortName
	"raise an error if a port name is already in use."

	ports detect: [ :aPort | aPort name = aPortName ] ifNone: [ ^ self ].
	self error: 'Port "' , aPortName , '" already exist.'
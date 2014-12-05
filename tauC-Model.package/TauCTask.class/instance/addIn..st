initialize-release
addIn: aPortName
	"Add a symbolic port or an port array. "

	self addPort: (TauCInPort named: aPortName on: self)
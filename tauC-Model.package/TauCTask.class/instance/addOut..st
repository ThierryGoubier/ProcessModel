initialize-release
addOut: aPortName
	"Add a symbolic port or an port array. "

	self addPort: (TauCOutPort named: aPortName on: self)
initialize-release
addOut: aPortName size: aSize
	"Add a symbolic port or an port array. "

	self addPort: (TauCOutPort new: aSize named: aPortName on: self)
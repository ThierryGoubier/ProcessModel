initialize-release
addIn: aPortName size: aSize
	"Add a symbolic port or an port array. "

	self addPort: (TauCInPort new: aSize named: aPortName on: self)
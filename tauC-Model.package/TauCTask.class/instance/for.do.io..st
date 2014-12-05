initialize-release
for: aStateName do: aBlock io: aIOSpec
	"Start adding a state; it may be usefull to split. "

	stateFunctions at: aStateName put: {aBlock. aIOSpec }
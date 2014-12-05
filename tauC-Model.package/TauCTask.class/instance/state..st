initialize-release
state: anArrayOfStateFunctions
	"The format should be : name, block, data spec."

	anArrayOfStateFunctions do: [ :each | stateFunctions at: each first put: each allButFirst ]
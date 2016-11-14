private
hasPortNamed: aSymbol
	"Answer true if a symbol is the name of a port, false otherwise."

	^ ports anySatisfy: [ :aPort | aPort name = aSymbol ]
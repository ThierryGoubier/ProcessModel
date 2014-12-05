instance creation
named: aName on: aComponent pipe: aPipe
	"Create a single instance of the port on a pipe, name and component. "

	^ self new
		name: aName;
		component: aComponent;
		pipe: aPipe
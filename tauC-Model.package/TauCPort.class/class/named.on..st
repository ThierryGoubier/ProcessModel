instance creation
named: aName on: aComponent
	"Create a single instance of the port on a name and component. "

	^ self new
		name: aName;
		component: aComponent
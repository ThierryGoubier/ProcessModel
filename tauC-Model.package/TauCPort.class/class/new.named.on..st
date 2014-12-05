instance creation
new: aSize named: aName on: aComponent
	"Create an array of ports on a name and component. "

	^ self new
		size: aSize;
		name: aName;
		component: aComponent
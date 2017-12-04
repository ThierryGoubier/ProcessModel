explore
exploreInRoassal
	"Show a roassal display of the graph of processes."

	| view shape edges |
	view := RTView new.
	shape := RTEllipse new size: 40.
	view addAll: (shape elementsOn: processes) @ RTDraggable @ RTPopup.
	RTEdgeBuilder new
		view: view;
		shape:
			(RTLine new color: (Color blue alpha: 0.8))
				+ (RTSimpleArrowHead new color: (Color blue alpha: 0.8));
		objects: processes;
		connectFrom: #yourself toAll: #destinations.
	RTSugiyamaLayout on: view elements edges: view edges.
	self buildSlotsInView: view.
	view canvas addMenu: 'Step' callback: [ self smallStep ].
	view canvas addMenu: 'Run' callback: [ self step ].
	view canvas addMenu: 'In' callback: [ RTZoomInMove on: view ].
	view canvas addMenu: 'Out' callback: [ RTZoomOutMove on: view ].
	view open
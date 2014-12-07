explore
exploreInRoassal
	"Show a roassal display of the graph of processes."

	| view shape edges |
	view := RTView new.
	shape := RTEllipse new size: 40.
	view addAll: (shape elementsOn: processes) @ RTDraggable @ RTPopup.
	edges := RTEdge
		buildEdgesFromObjects: processes
		from: #yourself
		toAll: #destinations
		using: (RTLine new color: (Color blue alpha: 0.8)) + (RTSimpleArrowHead new color: (Color blue alpha: 0.8))
		inView: view.
	RTSugiyamaLayout on: view elements edges: view edges.
	self buildSlotsInView: view.
	view canvas addMenu: 'Step' callback: [ self step ].
	view canvas addMenu: 'In' callback: [ RTZoomInMove on: view ].
	view canvas addMenu: 'Out' callback: [ RTZoomOutMove on: view ].
	view open.
	view canvas camera focusOnCenterScaled
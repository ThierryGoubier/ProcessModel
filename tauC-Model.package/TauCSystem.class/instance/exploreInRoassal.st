explore
exploreInRoassal
	"Show a roassal display of the graph of processes."

	| view shape edges fifos fifoShape pipes |
	view := RTView new.
	shape := RTEllipse new size: 40.
	pipes := IdentitySet new.
	fifoShape := RTBox new
		height: 40;
		width: 10.
	processes
		do: [ :p | 
			view add: (shape elementOn: p) @ RTDraggable @ RTPopup.
			pipes addAll: p outPipes.
			view add: (fifoShape elementsOn: p outPipes) @ RTDraggable ].
	pipes := pipes asArray.
	RTEdgeBuilder new
		view: view;
		shape: (RTLine new color: (Color blue alpha: 0.8));
		objects: processes , pipes;
		connectFrom: #yourself
			toAll: [ :o | 
			(processes includes: o)
				ifFalse: [ #() ]
				ifTrue: [ o outPipes ] ].
	RTEdgeBuilder new
		view: view;
		shape:
			(RTLine new color: (Color blue alpha: 0.8))
				+ (RTSimpleArrowHead new color: (Color blue alpha: 0.8));
		objects: processes , pipes;
		connectFrom: #yourself
			to: [ :o | 
			(pipes includes: o)
				ifTrue: [ o destination ]
				ifFalse: [ nil ] ].
	RTSugiyamaLayout on: view elements edges: view edges.
	self buildSlotsInView: view.
	view canvas addMenu: 'Step' callback: [ self smallStep ].
	view canvas addMenu: 'Run' callback: [ self step ].
	view canvas addMenu: 'In' callback: [ RTZoomInMove on: view ].
	view canvas addMenu: 'Out' callback: [ RTZoomOutMove on: view ].
	view open
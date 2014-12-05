explore
exploreInRoassal
	"Show a roassal display of the graph of processes."

	| view rawView |
	rawView := ROView new.
	view := ROMondrianViewBuilder view: rawView.
	view shape ellipse size: 40.
	view nodes: processes.
	view shape arrowedLine.
	view edgesToAll: #ends.
	view sugiyamaLayout.
	ROEaselMorphic new populateMenuOn: view.
	view open
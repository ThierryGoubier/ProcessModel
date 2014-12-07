explore
buildSlotsInView: aView
	"Show all slots on top of arrows."

	processes do: [ :e | e outPorts do: [ :aPort | aPort buildSlotsInView: aView ] ]
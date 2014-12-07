displaying
rebuildSlots
	"Show all slots on top of arrows."

	| shape p1 p2 v d i |
	shape := RTEllipse new
		size: 8;
		color: (Color red alpha: 0.4).
	p1 := view elementFromModel: start component.
	p2 := view elementFromModel: end component.
	v := p2 position - p1 position.
	d := (v x * v x + (v y * v y)) sqrt.
	i := 1.
	buffer
		do: [ :s | 
			| sP |
			sP := p1 position + (v * (1 - (6 * i / d))).
			i := i + 1.
			view add: ((shape elementOn: s) @ RTPopup translateTo: sP) ].
	view signalUpdate
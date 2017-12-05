displaying
rebuildSlots
	"Show all slots on top of arrows."

	| shape p1 p2 v d i |
	shape := RTEllipse new
		size: 8;
		color: (Color red alpha: 0.4).
	p1 := view elementFromModel: self.
	v := p1 position + (0 @ (p1 height / 2.0)).
	i := 1.
	buffer
		do: [ :s | 
			| sP |
			sP := v - (0 @ (6 * i)).
			i := i + 1.
			view add: ((shape elementOn: s) @ RTPopup translateTo: sP) ].
	view signalUpdate
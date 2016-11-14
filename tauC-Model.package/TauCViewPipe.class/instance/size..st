accessing
size: aSize
	"Transform itself into a version with a limited buffer. Only doable at initialisation time, when the view is unknown."

	| fixed |
	fixed := TauCFixedPipe from: start to: end size: aSize.
	start pipe: nil.
	start pipe: fixed.
	end pipe: nil.
	end pipe: fixed
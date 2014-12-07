protocol
read: aCollection
	"The collection gives the relevant amount we need to read. But can we block until the amount is available? "

	1 to: aCollection size do: [ :i | aCollection at: i put: buffer removeFirst slot ].
	^ aCollection
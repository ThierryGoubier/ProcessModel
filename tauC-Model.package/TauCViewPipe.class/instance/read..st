protocol
read: aCollection
	"The collection gives the relevant amount we need to read. But can we block until the amount is available? "

	view ifNotNil: [ buffer do: [ :each | (view elementFromModel: each) ifNotNil: [ :el | view removeElement: el ] ] ].
	1 to: aCollection size do: [ :i | aCollection at: i put: buffer removeFirst slot ].
	view ifNotNil: [ self rebuildSlots ].
	^ aCollection
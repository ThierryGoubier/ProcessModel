tests-api
testSystemSplit
	"Test a task creation from the system object"

	| s split |
	s := TauCSystem new.
	split := s newSplit1to: 2.
	self assert: split class == TauCSplit.
	self assert: (s processes includes: split)
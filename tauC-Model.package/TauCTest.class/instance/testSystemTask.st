tests-api
testSystemTask
	"Test a task creation from the system object"

	| s sender |
	s := TauCSystem new.
	sender := s newTask.
	self assert: sender class == TauCTask.
	self assert: (s processes includes: sender)
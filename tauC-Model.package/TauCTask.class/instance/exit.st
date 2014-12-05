execution
exit
	Transcript show: 'task exiting '; cr.
	ports
		do: [ :port | 
			port isOut
				ifTrue: [ port close ] ].
	TauCExitNotification signal.
	^ true
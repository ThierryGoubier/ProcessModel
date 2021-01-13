baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec
				baseline: 'Roassal2'
					with: [ spec
								repository: 'github://ObjectProfile/Roassal2:pharo7/src' ];
				import: 'Roassal2'.
			spec
				package: 'tauC-Model' with: [ spec requires: #('Roassal2') ];
				group: 'default' with: #('tauC-Model') ]

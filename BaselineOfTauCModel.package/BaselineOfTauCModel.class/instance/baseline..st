baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec
				package: 'tauC-Model';
				group: 'default' with: #('tauC-Model') ]
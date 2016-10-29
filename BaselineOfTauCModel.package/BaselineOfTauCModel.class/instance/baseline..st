baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec
				configuration: 'Roassal2'
					with: [ 
							spec
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main' ];
				yourself.
			spec
				package: 'tauC-Model' with: [ spec requires: #('Roassal2') ];
				group: 'default' with: #('tauC-Model') ]
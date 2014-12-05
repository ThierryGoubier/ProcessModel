initialize-release
initialize
	ports := Set new.
	stateFunctions := IdentityDictionary new.
	self for: #exit do: [ self exit ] io: #()
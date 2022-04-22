!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test01EnElInicioDeLosTiemposNoHayHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeOrugas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeOrugas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeOrugas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDePolillas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDePolillas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDePolly
		isEqualTo: 1.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella
		isEqualTo: 1.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeLara
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDePolly
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeLara
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
habitat
	^ habitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
hacerQueElHabitatTengaLosRecursosSuficientes
	^ self.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
laAvispaLara
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
laAvispaOriana
	^ laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
laAvispaOrnella
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
laAvispaPolly
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
queElHabitatTengaDosOrugasMas
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
queElHabitatTengaDosPolillasMas
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
queElHabitatTengaUnaOrugaMas
	habitat sumarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
queElHabitatTengaUnaPolillaMas
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
retrocederElHabitatAlInicioDeLosTiempos
	habitat cantidadDeHuevosEn0.
	habitat cantidadDeOrugasEn0.! !


!classDefinition: #habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'habitat class' category: 'AvispasYAbejasParte2'!
habitat class
	instanceVariableNames: 'cantidadDeHuevos cantidadDeOrugas'!

!habitat class methodsFor: 'metodo avispas'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevos.! !

!habitat class methodsFor: 'metodo avispas'!
cantidadDeHuevosEn0
	cantidadDeHuevos _ 0.! !

!habitat class methodsFor: 'metodo avispas'!
sumarUnHuevo
	cantidadDeHuevos _ cantidadDeHuevos + 1.! !


!habitat class methodsFor: 'metodo orugas'!
cantidadDeOrugasEn0
	cantidadDeOrugas _ 0.! !

!habitat class methodsFor: 'metodo orugas'!
sumarOruga
	cantidadDeOrugas _ cantidadDeOrugas + 1.! !


!habitat class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	cantidadDeHuevos _ 0.
	cantidadDeOrugas _ nil.! !


!classDefinition: #laAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaOriana class' category: 'AvispasYAbejasParte2'!
laAvispaOriana class
	instanceVariableNames: 'cantidadHuevosAvispas'!

!laAvispaOriana class methodsFor: 'metodos avispas'!
intentarReproducirse
	habitat sumarUnHuevo.! !


!laAvispaOriana class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	cantidadHuevosAvispas _ 1.! !

habitat initializeAfterFileIn!
laAvispaOriana initializeAfterFileIn!
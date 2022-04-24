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


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'IACS 4/22/2022 19:08:36'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'IACS 4/22/2022 19:08:36'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeOrugas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'IACS 4/22/2022 19:08:35'!
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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'IACS 4/22/2022 19:08:36'!
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


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'IACS 4/22/2022 19:08:35'!
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

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 18:15:03'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^habitat cantidadDeHuevosDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 18:25:46'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella	^self cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 18:21:38'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^habitat cantidadDeHuevosDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
habitat
	^ habitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 19:22:14'!
hacerQueElHabitatTengaLosRecursosSuficientes	self queElHabitatTengaDosOrugasMas.
	self queElHabitatTengaUnaPolillaMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
laAvispaLara
	Assert
		isTrue: false
		description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar'!
laAvispaOriana
	^ laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 19:10:37'!
laAvispaOrnella
	^laAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 19:14:00'!
laAvispaPolly	^laAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 15:16:19'!
queElHabitatTengaDosOrugasMas	habitat sumarUnaOruga.
	habitat sumarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 19:24:21'!
queElHabitatTengaDosPolillasMas	habitat sumarUnaPolilla.
	habitat sumarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 15:07:21'!
queElHabitatTengaUnaOrugaMas
	habitat sumarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 19:15:10'!
queElHabitatTengaUnaPolillaMas	habitat sumarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/22/2022 19:16:56'!
retrocederElHabitatAlInicioDeLosTiempos
	habitat ponerCantidadDeHuevosEn0.
	habitat ponerCantidadDeOrugasEn0.
	habitat ponerCantidadDePolillasEn0.! !


!classDefinition: #habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'habitat class' category: 'AvispasYAbejasParte2'!
habitat class
	instanceVariableNames: 'cantidadDeHuevos cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeOriana cantidadDeHuevosDePolly'!

!habitat class methodsFor: 'metodosDeLasAvispas'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevos.! !

!habitat class methodsFor: 'metodosDeLasAvispas' stamp: 'IACS 4/22/2022 19:18:31'!
cantidadDePolillas
	^cantidadDePolillas! !

!habitat class methodsFor: 'metodosDeLasAvispas' stamp: 'IACS 4/24/2022 18:24:35'!
ponerCantidadDeHuevosEn0
	cantidadDeHuevos _ 0.
	cantidadDeHuevosDeOriana := 0.
	cantidadDeHuevosDePolly := 0.! !

!habitat class methodsFor: 'metodosDeLasAvispas'!
sumarUnHuevo
	cantidadDeHuevos _ cantidadDeHuevos + 1.! !


!habitat class methodsFor: 'metodosDeLasOrugas' stamp: 'IACS 4/22/2022 15:11:45'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!habitat class methodsFor: 'metodosDeLasOrugas' stamp: 'IACS 4/22/2022 15:15:05'!
capturarUnaOruga
	cantidadDeOrugas _ cantidadDeOrugas - 1.! !

!habitat class methodsFor: 'metodosDeLasOrugas' stamp: 'IACS 4/22/2022 15:38:29'!
hayOrugas
	^cantidadDeOrugas > 0.! !

!habitat class methodsFor: 'metodosDeLasOrugas' stamp: 'IACS 4/22/2022 15:09:38'!
ponerCantidadDeOrugasEn0
	cantidadDeOrugas _ 0.! !

!habitat class methodsFor: 'metodosDeLasOrugas' stamp: 'IACS 4/22/2022 15:07:20'!
sumarUnaOruga
	cantidadDeOrugas _ cantidadDeOrugas + 1.! !


!habitat class methodsFor: 'metodosDeLasPolillas' stamp: 'IACS 4/22/2022 19:23:24'!
capturarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !

!habitat class methodsFor: 'metodosDeLasPolillas' stamp: 'IACS 4/22/2022 19:21:15'!
hayPolillas
	^cantidadDePolillas > 0.! !

!habitat class methodsFor: 'metodosDeLasPolillas' stamp: 'IACS 4/22/2022 19:18:11'!
ponerCantidadDePolillasEn0
	cantidadDePolillas := 0.! !

!habitat class methodsFor: 'metodosDeLasPolillas' stamp: 'IACS 4/22/2022 19:16:17'!
sumarUnaPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !


!habitat class methodsFor: 'metodosDeFirmasGeneticas3' stamp: 'IACS 4/24/2022 18:11:57'!
cantidadDeHuevosDeOriana
	^cantidadDeHuevosDeOriana.! !

!habitat class methodsFor: 'metodosDeFirmasGeneticas3' stamp: 'IACS 4/24/2022 18:22:32'!
cantidadDeHuevosDePolly
	^cantidadDeHuevosDePolly.! !

!habitat class methodsFor: 'metodosDeFirmasGeneticas3' stamp: 'IACS 4/24/2022 18:18:36'!
ponerUnHuevoDeOriana
	cantidadDeHuevos := cantidadDeHuevos + 1.
	cantidadDeHuevosDeOriana := cantidadDeHuevosDeOriana + 1.! !

!habitat class methodsFor: 'metodosDeFirmasGeneticas3' stamp: 'IACS 4/24/2022 18:23:39'!
ponerUnHuevoDePolly
	cantidadDeHuevos := cantidadDeHuevos + 1.
	cantidadDeHuevosDePolly := cantidadDeHuevosDePolly + 1.! !


!habitat class methodsFor: '--** private fileout/in **--' stamp: 'IACS 4/24/2022 18:26:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevos := 1.
	cantidadDeOrugas := 1.
	cantidadDePolillas := 1.
	cantidadDeHuevosDeOriana := 1.
	cantidadDeHuevosDePolly := 0.! !


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

!laAvispaOriana class methodsFor: 'metodos avispas' stamp: 'IACS 4/24/2022 18:19:43'!
intentarReproducirse
	(habitat hayOrugas) ifTrue:
		[		habitat capturarUnaOruga.
		habitat ponerUnHuevoDeOriana.
		]! !


!laAvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'IACS 4/24/2022 18:26:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadHuevosAvispas := 1.! !


!classDefinition: #laAvispaOrnella category: 'AvispasYAbejasParte2'!
laAvispaOriana subclass: #laAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaOrnella class' category: 'AvispasYAbejasParte2'!
laAvispaOrnella class
	instanceVariableNames: ''!

!laAvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'IACS 4/24/2022 18:26:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadHuevosAvispas := nil.! !


!classDefinition: #laAvispaPolly category: 'AvispasYAbejasParte2'!
laAvispaOriana subclass: #laAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaPolly class' category: 'AvispasYAbejasParte2'!
laAvispaPolly class
	instanceVariableNames: ''!

!laAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'IACS 4/24/2022 18:23:02'!
intentarReproducirse
	(habitat hayPolillas) ifTrue:
		[
		habitat capturarUnaPolilla.
		habitat ponerUnHuevoDePolly.
		]! !


!laAvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'IACS 4/24/2022 18:26:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadHuevosAvispas := nil.! !

habitat initializeAfterFileIn!
laAvispaOriana initializeAfterFileIn!
laAvispaOrnella initializeAfterFileIn!
laAvispaPolly initializeAfterFileIn!
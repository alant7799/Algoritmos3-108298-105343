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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 22:04:03'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^habitat cantidadDeHuevosConFirmaGeneticaDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:44:59'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^habitat cantidadDeHuevosConFirmaGeneticaDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:47:34'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^habitat cantidadDeHuevosConFirmaGeneticaDeOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:46:45'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^habitat cantidadDeHuevosConFirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 20:59:20'!
habitat
	^habitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:38:36'!
hacerQueElHabitatTengaLosRecursosSuficientes	habitat sumarUnaOruga.
	habitat sumarUnaOruga.
	habitat sumarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 22:00:49'!
laAvispaLara
	^laAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:04:27'!
laAvispaOriana
	^laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:33:12'!
laAvispaOrnella
	^laAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:36:44'!
laAvispaPolly
	^laAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:29:52'!
queElHabitatTengaDosOrugasMas	habitat sumarUnaOruga.
	habitat sumarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:40:26'!
queElHabitatTengaDosPolillasMas	habitat sumarUnaPolilla.
	habitat sumarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:23:52'!
queElHabitatTengaUnaOrugaMas
	habitat sumarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:40:43'!
queElHabitatTengaUnaPolillaMas	habitat sumarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IACS 4/24/2022 21:53:33'!
retrocederElHabitatAlInicioDeLosTiempos	habitat iniciarNuevoHabitat.! !


!classDefinition: #habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'habitat class' category: 'AvispasYAbejasParte2'!
habitat class
	instanceVariableNames: 'coleccionDeHuevos cantidadDeOrugas cantidadDePolillas nidoDeOriana nidoDeOrnella nidoDePolly nidoDeLara'!

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'IACS 4/24/2022 22:04:31'!
cantidadDeHuevosConFirmaGeneticaDeLara
	^coleccionDeHuevos at: nidoDeLara.! !

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'AT 4/24/2022 23:13:29'!
cantidadDeHuevosConFirmaGeneticaDeOriana
	^coleccionDeHuevos at: nidoDeOriana.! !

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'IACS 4/24/2022 21:49:12'!
cantidadDeHuevosConFirmaGeneticaDeOrnella
	^self cantidadDeHuevosConFirmaGeneticaDeOriana.! !

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'IACS 4/24/2022 21:04:02'!
cantidadDeHuevosDeAvispas
	^coleccionDeHuevos sum.! !

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'IACS 4/24/2022 22:13:09'!
hayHuevos
	^self cantidadDeHuevosConFirmaGeneticaDePolly + self cantidadDeHuevosConFirmaGeneticaDeOriana > 0.! !

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'IACS 4/24/2022 22:03:33'!
ponerUnHuevoDeLara
	|cantidadDeHuevosDeLara|.
	cantidadDeHuevosDeLara := coleccionDeHuevos at: nidoDeLara.
	coleccionDeHuevos at: nidoDeLara put: cantidadDeHuevosDeLara + 1.! !

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'IACS 4/24/2022 21:54:00'!
ponerUnHuevoDeOriana
	|cantidadDeHuevosDeOriana|.
	cantidadDeHuevosDeOriana := coleccionDeHuevos at: nidoDeOriana.
	coleccionDeHuevos at: nidoDeOriana put: cantidadDeHuevosDeOriana + 1.! !

!habitat class methodsFor: 'metodosDeHuevos' stamp: 'IACS 4/24/2022 21:54:46'!
ponerUnHuevoDePolly
	|cantidadDeHuevosDePolly|.
	cantidadDeHuevosDePolly := coleccionDeHuevos at: nidoDePolly.
	coleccionDeHuevos at: nidoDePolly put: cantidadDeHuevosDePolly + 1.! !


!habitat class methodsFor: 'metodosDePolillas' stamp: 'IACS 4/24/2022 21:48:13'!
cantidadDeHuevosConFirmaGeneticaDePolly
	^coleccionDeHuevos at: 2.! !

!habitat class methodsFor: 'metodosDePolillas' stamp: 'IACS 4/24/2022 21:41:05'!
cantidadDePolillas
	^cantidadDePolillas.! !

!habitat class methodsFor: 'metodosDePolillas' stamp: 'IACS 4/24/2022 21:36:17'!
capturarPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !

!habitat class methodsFor: 'metodosDePolillas' stamp: 'IACS 4/24/2022 21:35:03'!
hayPolillas
	^cantidadDePolillas > 0.! !

!habitat class methodsFor: 'metodosDePolillas' stamp: 'IACS 4/24/2022 21:35:26'!
sumarUnaPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !


!habitat class methodsFor: 'metodosDeOrugas' stamp: 'IACS 4/24/2022 21:26:51'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!habitat class methodsFor: 'metodosDeOrugas' stamp: 'IACS 4/24/2022 21:28:15'!
capturarOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!habitat class methodsFor: 'metodosDeOrugas' stamp: 'IACS 4/24/2022 21:31:52'!
hayOrugas
	^cantidadDeOrugas > 0.! !

!habitat class methodsFor: 'metodosDeOrugas' stamp: 'IACS 4/24/2022 21:25:45'!
sumarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.! !


!habitat class methodsFor: 'metodosDeRoboDeHuevos' stamp: 'IACS 4/24/2022 22:32:58'!
intentarRobarAOrianaUOrnella
	(self cantidadDeHuevosConFirmaGeneticaDeOriana >0 ) ifTrue:
		[self robarAOrianaUOrnella.
		^true]
	ifFalse:
		[^false]. ! !

!habitat class methodsFor: 'metodosDeRoboDeHuevos' stamp: 'IACS 4/24/2022 22:30:46'!
robarAOrianaUOrnella
	|cantidadDeHuevosDeOriana|.
	cantidadDeHuevosDeOriana := coleccionDeHuevos at: nidoDeOriana.
	coleccionDeHuevos at: nidoDeOriana put: cantidadDeHuevosDeOriana - 1.! !

!habitat class methodsFor: 'metodosDeRoboDeHuevos' stamp: 'IACS 4/24/2022 22:31:19'!
robarAPolly
	|cantidadDeHuevosDePolly|.
	cantidadDeHuevosDePolly := coleccionDeHuevos at: nidoDePolly.
	coleccionDeHuevos at: nidoDePolly put: cantidadDeHuevosDePolly - 1.! !

!habitat class methodsFor: 'metodosDeRoboDeHuevos' stamp: 'IACS 4/24/2022 22:33:57'!
robarUnHuevo
	(self intentarRobarAOrianaUOrnella) ifFalse:
		[self robarAPolly].! !


!habitat class methodsFor: 'metodosPrivados' stamp: 'IACS 4/24/2022 21:56:05'!
iniciarNuevoHabitat
	self ponerHuevosEn0.
	self ponerOrugasEn0.
	self ponerPolillasEn0.
	nidoDeOriana := 1.
	nidoDeOrnella := 1.
	nidoDePolly := 2.
	nidoDeLara := 3.! !

!habitat class methodsFor: 'metodosPrivados' stamp: 'IACS 4/24/2022 21:50:52'!
ponerHuevosEn0
	coleccionDeHuevos := OrderedCollection newFrom: #(0 0 0).! !

!habitat class methodsFor: 'metodosPrivados' stamp: 'IACS 4/24/2022 21:25:42'!
ponerOrugasEn0
	cantidadDeOrugas := 0.! !

!habitat class methodsFor: 'metodosPrivados' stamp: 'IACS 4/24/2022 21:35:54'!
ponerPolillasEn0
	cantidadDePolillas := 0.! !


!habitat class methodsFor: '--** private fileout/in **--' stamp: 'AT 4/24/2022 23:14:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	coleccionDeHuevos := ((OrderedCollection new) add: 1; add: 0; add: 0; yourself).
	cantidadDeOrugas := 1.
	cantidadDePolillas := 1.
	nidoDeOriana := 1.
	nidoDeOrnella := 1.
	nidoDePolly := 2.
	nidoDeLara := 3.! !


!classDefinition: #laAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaOriana class' category: 'AvispasYAbejasParte2'!
laAvispaOriana class
	instanceVariableNames: ''!

!laAvispaOriana class methodsFor: 'metodosDeReproduccion' stamp: 'IACS 4/24/2022 21:31:30'!
intentarReproducirse
	(habitat hayOrugas) ifTrue:[
	habitat ponerUnHuevoDeOriana.
	habitat capturarOruga.
	]! !


!classDefinition: #laAvispaLara category: 'AvispasYAbejasParte2'!
laAvispaOriana subclass: #laAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaLara class' category: 'AvispasYAbejasParte2'!
laAvispaLara class
	instanceVariableNames: ''!

!laAvispaLara class methodsFor: 'as yet unclassified' stamp: 'IACS 4/24/2022 22:05:33'!
intentarReproducirse
	(habitat hayHuevos) ifTrue:[
		habitat robarUnHuevo.
		habitat ponerUnHuevoDeLara.
	]! !


!classDefinition: #laAvispaOrnella category: 'AvispasYAbejasParte2'!
laAvispaOriana subclass: #laAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


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

!laAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'IACS 4/24/2022 21:34:15'!
intentarReproducirse
	(habitat hayPolillas) ifTrue:[
	habitat ponerUnHuevoDePolly.
	habitat capturarPolilla.
	]! !

habitat initializeAfterFileIn!
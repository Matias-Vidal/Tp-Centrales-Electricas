import centrales.*

object springfield {
	const todasLasCentrales = [burns,exBosque,elSuspiro]
	var produccionTotal = 0
	method produccionAcumulada(uranio,capacidad){
		todasLasCentrales.forEach({central => central.producirEnergia(uranio,capacidad)})
		produccionTotal = todasLasCentrales.sum({central=> central.produccionDeEnergia()})
	}
	method lasCentralesQueContaminan(uranio,capacidad){
		self.produccionAcumulada(uranio,capacidad)
		return	todasLasCentrales.filter({centrales => centrales.centralContaminante()})
	}
	method laProduccionDeLaCentral(laCentral,uranio,capacidad){
		laCentral.producirEnergia(uranio,capacidad)
		return laCentral.produccionDeEnergia()
	}
	method necesidadEnergetica(consumo,uranio,capacidad){
		self.produccionAcumulada(uranio,capacidad)
		return consumo < produccionTotal
	}
	method estaEnElHorno(consumo,uranio,capacidad){
		var centralesContaminantes= []
		centralesContaminantes = self.lasCentralesQueContaminan(uranio,capacidad)
		return (consumo/2 < centralesContaminantes.sum({centrales=>centrales.produccionDeEnergia()})) || todasLasCentrales.all({centrales=>centrales.centralContaminante()})
	}
	method centralesDeMayorProduccion(uranio,capacidad){
		var mejorProduccion = [albuquerque]
		self.produccionAcumulada(uranio,capacidad)
		mejorProduccion.add(todasLasCentrales.max({centrales=> centrales.produccionDeEnergia()}))
		return mejorProduccion
	}
}

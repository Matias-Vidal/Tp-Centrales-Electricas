object burns {
	var produccionEnergetica = 0
	var varillasDeUranio = 0
	
	method producirEnergia(uranio,capacidad){
		varillasDeUranio = uranio
		produccionEnergetica = 0.1*uranio
	}	
	method produccionDeEnergia(){
		return produccionEnergetica
	}
	method centralContaminante(){
		return varillasDeUranio >= 20
	}
}

object exBosque{
	var produccionEnergetica = 0.5
	const riquezaDelSuelo = 0.9
	
	method producirEnergia(uranio,capacidad){
		produccionEnergetica = 0.5 + capacidad * riquezaDelSuelo
	}
	method produccionDeEnergia(){
		return produccionEnergetica
	}
	method centralContaminante(){
		return true
	}
}

object turbina1{
	var produccionEnergetica = 0
	const viento = 10
	
	method producirEnergia(){
		produccionEnergetica = 0.2 * viento
	}
	method produccionDeEnergia(){
		return produccionEnergetica
	}
}

object elSuspiro{
	var produccionEnergetica = 0
	var todasLasTurbinas = [turbina1]
	
	method producirEnergia(uranio,capacidad){
		todasLasTurbinas.forEach({turbina => turbina.producirEnergia()})
		produccionEnergetica= todasLasTurbinas.sum({turbina => turbina.produccionDeEnergia()})
	}
	method produccionDeEnergia(){
		return produccionEnergetica
	}
	method agregarTurbinas(turbinas){
		todasLasTurbinas.addAll([turbinas])
	}
	method centralContaminante(){
		return false
	}
	}

object albuquerque{
	const caudal = 150
	var produccionEnergetica = 0
	method producirEnergia(uranio,capacidad){
		produccionEnergetica = 2*caudal
	}
	method produccionDeEnergia(){
		return produccionEnergetica
	}
	method centralContaminante(){
		return false
	}
}

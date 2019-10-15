//Eventos
import Banda.*

class Evento {
	
	var bandaPrincipal = vacia
	var sede 
	
	method participa(unaBanda)
	
	method hayCupo(unaBanda) 
	
	method duracionTotal()
	
	method comparteGenero(unaBanda)
	
	method puedeSerPrincipal(unaBamda)
	
	method esLargo()
	
	//method incluyeElGenero(unGenero) //punto7
	
	method incluyeElGenero(unGenero){
		return bandaPrincipal.generos().contains(unGenero)		
	}
	//punto 8
	
	method sePuedeHacerEn(unaSedde)
	
	
	method agregarA(unaBanda){
		if(self.hayCupo(unaBanda) && bandaPrincipal == vacia)
		{
			if(self.puedeSerPrincipal(unaBanda))
			{
				bandaPrincipal = unaBanda	
			}
		}
	}
	
	
	
}
class Festival inherits Evento{
	var  nombre
	var generos = [] 
	var  bandasSecundarias = []

	method bandasSecundarias() = bandasSecundarias //getter
	
	override method participa(unaBanda) {
		return bandasSecundarias.contains(unaBanda) || bandaPrincipal.equals(unaBanda)
	}
	
	override method hayCupo(unaBanda) {
		return (720 - self.duracionTotal())  > unaBanda.tiempoDeShow() && self.comparteGenero(unaBanda)
	}
	
	override method duracionTotal(){
		return bandasSecundarias.sum({bandaS => bandaS.tiempoDeShow()}) + bandaPrincipal.tiempoDeShow()
		
	}
	
	override method comparteGenero(unaBanda) {
		return generos.contains(unaBanda.genero())
	}
	
	override method agregarA(unaBanda) {
		if(self.hayCupo(unaBanda) && bandaPrincipal == vacia)
		{
			
			bandaPrincipal = unaBanda
		}
		if(self.hayCupo(unaBanda) && bandasSecundarias.isEmpty())
		{
			
		}
	}
	
	override method puedeSerPrincipal(unaBanda){
		return self.esLaMasPopular(unaBanda)		
	}
	
	method esLaMasPopular(unaBanda) {
		return (bandasSecundarias.max({bandaS => bandaS.discosVendidos()}).discosVendidos() < unaBanda.discosVendidos())
	}
	
	override method esLargo(){
		return self.duracionTotal() > 540//9 Horas
	}
	
	override method sePuedeHacerEn(unaSede){
		return unaSede.equals("estadio")
	}
		
}
class Recital inherits Festival {
	
	
	override method comparteGenero(unaBanda){
		return unaBanda.generos().equals(bandaPrincipal.generos())
	}
	override method hayCupo(unaBanda) {
		return bandasSecundarias.size() < 3 && self.comparteGenero(unaBanda)
	}
	override method puedeSerPrincipal(unaBanda){
		return bandasSecundarias.max({bandaS => bandaS.discosVendidos()}).discosVendidos() * 3 > unaBanda.discosVendidos() 
	}
	
	override method esLargo() {
		return bandasSecundarias.all({ bandaS => bandaS.timpoDeShow() >= 40}) && bandaPrincipal.tiempoDeShow() >= 40
	}
	
	override method incluyeElGenero(unGenero){
		return super(unGenero) || bandasSecundarias.map({bandaS => bandaS.generos()}).contains(unGenero)//REVISAR		
	}
}

class CenaShow inherits Evento{
	
	override method participa(unaBanda) {
		return bandaPrincipal == unaBanda
	}
	
	override method hayCupo(unaBanda) {
		return bandaPrincipal == vacia
	}
	
	override method puedeSerPrincipal(unaBanda) {
		return true
	}
	
	override method esLargo() {
		return false
	}
	
	
}








class Sede {
	var capacidad
	var ciudad
	var historialDeEventos
	// 	var
	// puede ser Estadio o Anfiteatro
	//capacidad
	//ciudad
	// historial De Eventos
	
	
	//punto 6method band
}

const vacia = new BandaEstructurada()


//Eventos
import Banda.*

class Evento {
	
	var bandaPrincipal = vacia
	
	method participa(unaBanda)
	
	method hayCupo(unaBanda) 
	
	method duracionTotal()
	
	method comparteGenero(unaBanda)
	
	method agregarA(unaBanda)
	
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
	// % Festivales % //
	//participan muchas Bandas sin restricciones de algunos Generos en particular
	//maximo de 12 hs de duracion
	//banda principarl = debetner mas copias vendidas sumando todos sus discos q otra banda
	//solo en Estadios
		
}
class Recital inherits Festival {
	
	
	override method comparteGenero(unaBanda){
		return unaBanda.genero().equals(bandaPrincipal.genero())
	}
	override method hayCupo(unaBanda) {
		return bandasSecundarias.size() < 3 && self.comparteGenero(unaBanda)
	}
	// % Recital %
	// banda principal + bandas soportes <= 3 y algun genero en comun con la principal
	//la Banda PRincipal haber vendido, al menos, el triple de copias que cualquiera de las bandas
	//en cualquier lugar
}

class CenaShow inherits Evento{
	
	override method participa(unaBanda) {
		return bandaPrincipal == unaBanda
	}
	
	override method hayCupo(unaBanda) {
		return bandaPrincipal == vacia
	}
	// % Cena Show %
	// una unica banda 
	// solo en Anfiteatros
}



class Sede {
	// 	var
	// puede ser Estadio o Anfiteatro
	//capacidad
	//ciudad
	// historial De Eventos
}

const vacia = new BandaEstructurada()


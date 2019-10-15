
class Recital {
	
	var property bandas = []
	
	 	/* Interfaz EVENTO */
	
	method bandaPrincipal() {
		return bandas.find({
			banda => banda.tocaDiscoCompleto()
		})
	}
	
	method duracion () {
		return self.bandaPrincipal().tiempoEnEscenario() + self.bandaSecundaria().tiempoEnEscenario()
	}
	
	method rockStar () {
		return self.bandaPrincipal().lider()
	}
	
	method bandaSecundaria() {
		return bandas.find({
			banda => banda.tocaDiscoCompleto().negate()
		})
	}
	
	method cambioDePlanes() {
		self.bandaPrincipal().tiempoEscenario((self.bandaPrincipal().duracionDeDisco()) / 2)
		self.bandaSecundaria().tiempoEscenario(self.bandaSecundaria().duracionDeDisco())
	}
}
	
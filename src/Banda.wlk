class Banda  {
	var nombre
	var property integrantes
	var property discos = []
	var genero
	
	method edad ()
	
	method discoAPresentar()
	
	method tiempoDeShow()
	
	
	/*------------------------------- */
	// %%% Punto 1 %%% 
	method discosVendidos() {
		return discos.sum({
			disco => disco.duracionEnMinutos()
		})
	}
	
	// %%% Punto 2 %%% 
	method ultimoEditado() {
		return self.discosOrdenadosPorAnioDeEdicion().first()
	}
	
	method discosOrdenadosPorAnioDeEdicion() {
		return discos.sortedBy({
			disco1, disco2 => disco1.anioPublicacion() < disco2.anioPublicacion()
		})
	}
	
	// %%% Punto 3 %%%
	method puedeAgregarseA(unEvento) {
		
		return self.estaEn(unEvento).negate() && unEvento.hayCupoPara(self)
		
	} 
	
	method estaEn(unEvento) {
		return unEvento.participa(self)
	}
	
	method genero() = genero //getter
	
	// %%% Punto 4 %%%
	
	method agregateA(unEvento) {
		unEvento.agregarA(self)
	}
	
	// punto 5
	//ocurre en evento
	
	//punto 6
	
}

class BandaFundacional inherits Banda {
	var integrantesOriginales
	var anioDeFundacion
	
	
	
	method diferenciaDeIntegrantes() {
		return (integrantes - integrantesOriginales).abs()
	}
	
	override method edad() {
		return 2019 - anioDeFundacion
	}
	
	override method discoAPresentar() {
		return discos.masAntiguo()
	}
	
	override method tiempoDeShow() {
		return 40 + 10 * self.diferenciaDeIntegrantes()
	}
	
	//presentan su primer disco, el mas antiguo
	//tocan 40 m + 10*(integrantesActuales - integranOriginales)
}

class BandaDisquera inherits Banda {
	
	
	method anioDeFundacion() {
		return discos.primerDisco()
	}
	
	override method edad() {
		return 2019- self.anioDeFundacion()
	}
	
	override method discoAPresentar() {
		return discos.masTaquillero()
	}
	
	override method tiempoDeShow() {
		return discos.masLargoEnTiempo().tiempo()
	}
	//anio de fundacion es la del primer Disco
	//presentan el disco mas taquillero q tienen (el mas vendido)
	//tocan lo q dure su disco mas Largo
}

class BandaEstructurada inherits Banda {
	var edad
	var discoAPresentar
	
	override method edad() = edad
	
	override method discoAPresentar() = discoAPresentar
	
	override method tiempoDeShow() = 60
	
	//presentan simpre EL mismo
	//tocan 60 m fijos 
}


import wollok.game.*
import extras.*
import generadorComida.*


object pepita {

	var energia = 100
	
	var property position=game.at(4, 5)
		
//	method position() {
//		return position
//	}
//	
//	method position(_position) {
//		position=_position
//	}
	
	method validarPosition(_position) {
		mundo.validarPosition(_position)
		self.validarAterrizar(_position)
	}
	method validarAterrizar(_position) {
		if (!self.puedeAterrizar(_position)) {
			self.error("No se puede pasar")
		}
	}
	method puedeAterrizar(_position) {
		return 	game.getObjectsIn(_position).
				all({visual => visual.atravesable()} )	
	}
	
	method mover(direccion) {
		const proximaPosition=direccion.siguiente(position)
		self.validarPosition(proximaPosition)
		self.volar(1)	
		position = proximaPosition		
	}
	
	method gravedad() {
		const siguiente = abajo.siguiente(position)
		if(position.y() > 0 && self.puedeAterrizar(siguiente)) {
			position = abajo.siguiente(position)
		}
	}
	
	method image() {
		return "pepita-"+ self.nombreEstado() + ".png"
	}
	
	method nombreEstado() {
		return if (self.atrapada()) "atrapada" else "libre" 
	}
	
	method atrapada() {
		return self.position() == silvestre.position()
	}
	
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		generadorComida.seComio(comida)
	}

	method volar(kms) {
		self.validarVolar(kms)
		energia = energia - self.energiaParaVolar(kms)
	}
	
	method validarVolar(kms) {
		if(energia < self.energiaParaVolar(kms)) {
			self.error("no puedo volar")
		}
	}
	
	method energiaParaVolar(kms) {
		return 10 + kms
	}
	
	
	method energia() {
		return energia
	}
	
	method ganar() {
		game.say(self, "Gané!")
		mundo.terminar()
	}
	
	method perder() {
		game.say(self, "Perdí!")
		mundo.terminar()
		
	}

}


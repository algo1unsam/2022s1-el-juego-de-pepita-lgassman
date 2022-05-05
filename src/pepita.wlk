import wollok.game.*
import extras.*


object pepita {

	var energia = 100
	
	var property position=game.at(5, 5)
		
//	method position() {
//		return position
//	}
//	
//	method position(_position) {
//		position=_position
//	}
	
	method mover(direccion) {
		position=direccion.siguiente(position)
		self.volar(1)
	}
	
	
//	method text() {
//		return "energia: " + energia
//	}
	
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
		game.removeVisual(comida)
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

}


import wollok.game.*
import pepita.*

object izquierda {
	
	method siguiente(position) {
		return 	position.left(1)
	}
}

object derecha {
	method siguiente(position) {
		return 	position.right(1)		
	}	
}

object abajo {
	method siguiente(position) {
		return position.down(1)
	}
}

object arriba {
	method siguiente(position) {
		return position.up(1)
	}
		
}

object silvestre{
	
	const property imagen = "silvestre.png"
	
	method atravesable() = true
	
	method image() {
		return imagen
	}
	
	method position() {
		return game.at(pepita.position().x(), 0)
	}
	
	method teEncontro(alguien) {
		alguien.perder()
	}
	
	
}

object mundo {
	
	method validarPosition(position) {
		if (! position.x().between(0, game.width() -1)){
			self.error("Posicion fuera de ancho")
		}	
		
		if(! position.y().between(0, game.height() - 1)) {
			self.error("Posicion fuera de alto")
		}
	}
	
	method terminar() {
		game.schedule(3000, {game.stop()})
	}
	
}

class Muro  {
	var property position
	const property image = "muro.png"
	
	method atravesable() = false
}

object nido {
	const property position = game.at(9,4)
	const property image = "nido.png"
	method atravesable() =  true
	
	method teEncontro(alguien) {
		alguien.ganar()
	}
	
}

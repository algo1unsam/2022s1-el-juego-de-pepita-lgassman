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
	
	method image() {
		return imagen
	}
	
	method position() {
		return game.at(pepita.position().x(), 0)
	}
	
}
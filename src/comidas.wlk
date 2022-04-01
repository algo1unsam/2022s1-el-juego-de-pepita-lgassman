import wollok.game.*

object manzana {
	const base= 20
	var madurez = 1

	method position() {
		return game.at(6, 7)	
	}	
	
	method image() {
		return "manzana.png"
	}
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
	}

}

object alpiste {

//	method energiaQueOtorga() {
//		return 150
//	}
	method energiaQueOtorga() = 150
	
	method position() {
		return game.at(4, 3)	
	}	
	
	method image() {
		return "alpiste.png"
	}
	

}


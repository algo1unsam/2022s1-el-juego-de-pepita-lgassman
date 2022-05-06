import wollok.game.*
import generadorComida.*

class Manzana {
	var property position = game.at(6, 7)
	const base= 20
	var madurez = 1
	const madurezMaxima = 6

	method atravesable() = true
	
	
	method image() {
		return "manzana.png"
	}
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		if(madurez >= madurezMaxima) {
			generadorComida.seComio(self)
		}
	}
	
	method teEncontro(alguien) {
		alguien.comer(self)
	}

	method pasoTiempo() {
		self.madurar()	
	}

}

class Alpiste {
	var property position = game.at(8, 3)
	const property peso = 30

	method energiaQueOtorga() {
		return peso
	}
	
	method image() {
		return "alpiste.png"
	}
	
	method atravesable() = true

	method teEncontro(alguien) {
		alguien.comer(self)
	}
	
	method pasoTiempo() {
		
	}

}


import wollok.game.*
import comidas.*
import randomizer.*
import extras.*

object manzanaFactory {
	method construirAlimento() {
		return new Manzana(position=randomizer.emptyPosition())
	}	
}

object alpisteFactory {
	method construirAlimento() {
		return new Alpiste(position=randomizer.emptyPosition(),
							peso= (40..100).anyOne()
		)		
	}
}

object generadorComida {
	const comidasMaximas = 3
	const objetosGenerados = []
	
	const factories = [manzanaFactory, alpisteFactory]
	
	method generar() {
		if(self.hayQueGenerar()) {
			const nuevo = self.nuevoAlimento()
			game.addVisual(nuevo)
			objetosGenerados.add(nuevo)
		}
	}
	
	method nuevoAlimento() {		
		return factories.anyOne().construirAlimento()
	}
	
	method gravedad() {
		objetosGenerados.forEach({alimento => 
			if(alimento.position().y() > 0 ) {
				alimento.position(abajo.siguiente(alimento.position()))			
			}
			else {
				alimento.pasoTiempo()
			}
			
		})
	}
	
	method hayQueGenerar() {
		return objetosGenerados.size() <= comidasMaximas
	}
	
	method seComio(alimento) {
		objetosGenerados.remove(alimento)
		game.removeVisual(alimento)
	}
	
}

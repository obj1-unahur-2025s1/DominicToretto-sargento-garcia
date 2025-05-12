object toretto {
  const autos = []

  method comprar(unAuto) {autos.add({unAuto})}

  method autosNoEnCondiciones() = autos.filter({a=> !a.estaEnCondiciones()})

  method autosEnCondiciones() = !self.autosNoEnCondiciones()   //dividir subtarea agregando metodos por mas que no lo pida el ejercicio y se puedan utilizar para ser mas legible.

  method mandarAutosAlTaller() {taller.recibirAutos(self.autosNoEnCondiciones())}

  method realizarPruebasDeVelocidad() {autos.forEach({a => a.hacerPrueba()})}

  method venderTodosLosAutos() {autos.clear()}

  method promedioVelocidad() = autos.sum({a => a.velocidadMaxima()}) / autos.size()

  method autoMasRapido() = self.autosEnCondiciones().max({a => a.velocidadMaxima()})

  method hayUnAutoMuyRapido() = self.autoMasRapido().velocidadMaxima() > self.promedioVelocidad() *2

  
}
//TALLER

object taller {
  const autosAReparar = []

  method recibirAutos(listaDeAutos) {autosAReparar.addAll(listaDeAutos)} 

  method reparaAutos() {
    autosAReparar.forEach({a => a.reparar()})
    autosAReparar.clear()
  }
}

//Los Autos
object laFerrari {
  var motor = 87

  method estaEnCondiciones() = motor >= 65

  method reparar() {motor = 100}

  method velocidadMaxima() = 110 + if(motor > 75) 15 else 0

  method hacerPrueba() {motor = (motor - 30).max(0)} 
}

object laFlechaRubi {
  var cantidadCombustible =  100
  var property color = azul
  var property combustible = gasolina   //property crea los 2 metodos combustible() getter y setter. por mas que no esten en codigo se puede Consultar.

  method enCondiciones() = 
    cantidadCombustible > combustible.nivelMinimo(cantidadCombustible) &&
    color.esAptoParaCorrer()

  method hacerPrueba() {
    cantidadCombustible = (cantidadCombustible - 5).max(0)
  }  
  method reparar() {
    cantidadCombustible = cantidadCombustible *2
    color = color.cambiarDeColor()
    }
  method velocidadMaxima() {
    return cantidadCombustible *2 + combustible.calculoAdicional(cantidadCombustible)
  }   
}

object intocable {
  var property enCondiciones = true

  method hacerPrueba() {enCondiciones = false} 

  method reparar() {enCondiciones = true}

  method velocidadMaxima() = 45  
}


//COMBUSTIBLES
object gasolina {
  method nivelMinimo() = 85

  method calculoAdicional(litros) = 10 
}
object nafta {
  method nivelMinimo() = 50

  method calculoAdicional(litros) = -1 * ((litros *2) * 0.1)
}
object nitrogeno {
  method nivelMinimo() = 0

  method calculoAdicional(litros) = litros * 2 * 10
}


//COLORES
object azul {
  method cambiarDeColor() =  verde

  method esAptoParaCorrer() = false
}
object rojo {
  method cambiarDeColor() =  azul

  method esAptoParaCorrer() = true
}
object verde {
  method cambiarDeColor() =  rojo

  method esAptoParaCorrer() = false
}
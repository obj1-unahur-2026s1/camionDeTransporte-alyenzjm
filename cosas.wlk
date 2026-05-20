object knightRider {
    method peso() = 500
    method nivelPeligro() = 10 
}

object bumblebee {
    var esRobot = false
    const nivelAuto = 15
    const nivelRobot = 30
    
    method peso() = 800
    method nivelPeligro() {
        var salida = nivelAuto
        if (esRobot) {
            salida = nivelRobot
        }
        return salida
    }

    method transformarEnRobot() {
        esRobot = true
    }

    method transformarEnAuto() {
        esRobot = false
    }    
}

object paqueteLadrillos {
    var cantLadrillos = 1
    
    method peso() = cantLadrillos * 2

    method cambiarCantLadrillos(nuevaCant) {
        cantLadrillos = nuevaCant
    }

    method nivelPeligro() = 2
}

object bateriaAntiaerea {
    var tieneMisil = false
    const pesoConMisil = 300
    const pesoSinMisil = 200
    const peligroConMisil = 100
    const peligroSinMisil = 0
    
    method peso() {
        var salida = pesoConMisil
        if (not tieneMisil) {
            salida = pesoSinMisil
        }
        return salida
    }

    method agregarMisil() {
        tieneMisil = true
    }

    method nivelPeligro() {
        var salida = peligroSinMisil
        if (tieneMisil) {
            salida = peligroConMisil
        }
        return salida
    }

}

object contenedor {
    const cosas = []

    method peso() = 100 + cosas.sum({cosa => cosa.peso()})

    method nivelPeligro() {
        if (not cosas.isEmpty()) {
            return cosas.max({cosa => cosa.nivelPeligro()})
        }
        return 0
    }
}

object embalaje {
    var cosa = knightRider

    method peso() = cosa.peso()

    method cambiarCosa(nuevaCosa) {
        cosa = nuevaCosa
    } 

    method nivelPeligro() = cosa.nivelPeligro() / 2
}
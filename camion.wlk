import cosas.*

object camion {
    const cosas = []
    const pesoCamion = 1000

    method pesoTotal() = pesoCamion + cosas.sum({cosa => cosa.peso()})
    
    method cargar(cosa) {
        cosas.add(cosa)
    }

    method descargar(cosa) {
        if (cosas.contains(cosa)) {
            cosas.remove(cosa)
        }
    }

    method pesoCosasSonPares() = cosas.all({cosa => cosa.peso().even()})

    method hayCosaDePeso(peso) = cosas.any({cosa => cosa.peso() == peso})

    method cosaPeligrosa(nivel) = cosas.find({cosa => cosa.nivelPeligro() == nivel})

    method cosasMasPeligrosas(nivel) = cosas.filter({cosa => cosa.nivelPeligro() > nivel})

    method cosasSegunCosa(cosa) = self.cosasMasPeligrosas(cosa.nivelPeligro())

    method esCamionPesado() = self.pesoTotal() > 2500

    method puedeCircularEnRuta(nivel) = not self.esCamionPesado() and self.cosasMasPeligrosas(nivel).isEmpty()

    method hayCosaEntrePeso(min , max) = cosas.any({cosa => cosa.peso().between(min, max)})

    method cosaMasPesada() = cosas.max({cosa => cosa.peso()})
}
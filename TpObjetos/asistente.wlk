import excepciones.*


class Asistente{
    var abono = fan
    const property historialDeEntradas = []
    var dineroDisponible

    method tieneSaldoPositivo() = dineroDisponible > 0

    method comprarEntrada(entrada){
        try{
            if(self.tieneSaldoPositivo()){
                historialDeEntradas.add(entrada)
                dineroDisponible -= abono.aplicarDescuento(entrada)
            }else{
                throw new NoTieneSaldoPositivoException()
            }
        }catch errorSaldoNegativo : NoTieneSaldoPositivoException{
            console.println(errorSaldoNegativo.message())
        }
    }  
    
    method entradasDeHaceUnAnio() = historialDeEntradas.filter({entrada => entrada.esDelAnioPasado()})

    method bandasPorLasQueComproUnaEntrada() = historialDeEntradas.map({entrada => entrada.banda()}).asSet()

    method gastoHistorico() = historialDeEntradas.map({entrada => entrada.precioFinal()}).sum()
}

object fan{
    method aplicarDescuento(entrada) = entrada.precioFinal()
}

class Vip{
    // El descuento es un porcentaje
    var descuento

    method aplicarDescuento(entrada) = entrada.precioFinal() * (1 - descuento + 0.01) // Se le suma un 1%
}


import asistente.*

object productora{

    var bandas = []
    var asistentes = []


    method ganancia() = self.activos() - self.pasivos()  

    method activos() = asistentes.map({asistente => asistente.gastoHistorico()}).sum() 

    method pasivos() = bandas.map({banda => banda.precioFinal()}).sum()

    method cantidadDeEntradasTotales() = self.entradasVendidasTotales().size()

    method entradasVendidasTotales() = asistentes.map({asistente => asistente.historialDeEntradas()}).flatten()

    method entradasVendidasDeBanda(banda) = self.entradasVendidasTotales().filter({entrada => entrada.banda() == banda}).size()
    
    method bandaConMasEntradas() = bandas.max({banda => self.entradasVendidasDeBanda(banda)})
}


class Banda{
    const nombre

    method cannon() = 1000000

    method precioFinal() = self.cannon() + self.precioExtra()

    method popularidad()

    method precioExtra() = 0
}

class Rock inherits Banda{
    const cantSolosDeGuitarra

    override method popularidad() = 100 * cantSolosDeGuitarra

    override method precioExtra() = 10000 
}

class Trap inherits Banda{
    const tieneHielo

    override method popularidad(){
        if(tieneHielo) return 1000
        return 0
    }

    override method cannon() = super() * self.popularidad()
}

class Indie inherits Banda{
    const instrumentos 
    
    override method popularidad() = 3.14 * nombre.size()

    override method precioExtra() = 500 * instrumentos 
}
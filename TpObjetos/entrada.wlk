import impuesto.*

class Entrada{
    const property banda
    const fecha

    method precioFinal() = 1000 + impuesto.valor()

    method esDelAnioPasado() = fecha.year() == new Date().year() - 1
}

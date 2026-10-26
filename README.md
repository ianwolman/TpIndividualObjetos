# TpIndividualObjetos

## Entradas

### Enunciado
"Compuestas por una banda y la fecha en la que toca. Si bien su precio base es 1000, al precio al público se le tiene que agregar el impuesto que fije la productora (el cual es el mismo para todas las entradas y podría variar cuando la productora quiera)"

### Explicacion
Se eligio usar la clase Date() para la fecha ya que permite aplicar metodos que simplifican la solucion mucho mas adelante cuando hay que calcular cosas del asistente. 
El precio base no se pone como atributo ya que siempre es el mismo y considere que no valia la pena hacer un atributo solo para eso. Directamente esta en la cuenta de precioFinal(). 
Para el impuesto se decidio crear un objeto para tener un valor compartido por todas las entradas, no algo que necesite tener una instancia propia para cada entrada.

## Asistentes

### Enunciado
"De cada asistente al show de una banda sabemos el tipo de abono que tiene, el historial de entradas (inicialmente no tiene ninguna) y su dinero disponible (que puede ser negativo). 

Si tiene un saldo positivo, debe poder comprar una entrada para una banda en una fecha en específico. Caso contrario deberá notificarse adecuadamente. El proceso de compra no sólo le resta el monto correspondiente a pagar por la entrada a su dinero disponible sino que también agrega la entrada a su historial.
El monto a pagar es el precio de la entrada teniendo en cuenta su abono, ya que podría otorgarle un porcentaje de descuento.

El abono puede ser fan o vip. El primero no tiene porcentaje de descuento y el segundo sí, el cual es particular para cada asistente.

Además, cada asistente deberá poder ver:
Todas las entradas que sacó el año anterior al actual.
El nombre de las bandas por las que compró una entrada."


### Explicacion
Para hacer los tipos de abono se decidio utilizar composicion para facilitar el intercambio de abonos si un asistente lo desee. Si se hubiera hecho una clase hubiera sido mas dificil. Se instancia con el abono "fan" ya que es el abono basico.
Solo se controla si tiene saldo positivo, no si tiene dinero suficiente para comprar la entrada.
Se utiliza el manejo de errores con try and catch para notificar correctamente si un asistente puede comprar una entrada. En el caso que no pueda, se muestra un mensaje.
El abono fan es un objeto ya que su descuento siempre es 0. El abono Vip es una clase ya que cada asistente tiene un tipo de abono distinto.
Es responsabilidad de la entrada saber si una entrada ha sido comprada el anio anterior al actual. Esa logica esta dentro de entrada mediante un metodo y en la clase asistente, mediante otro metodo, se ve cuales entradas dentro de la lista cumplen la condicion de haber sido comprada dentro del anio anterior al actual

## Bandas

### Enunciado
"Sobre las bandas sabemos que todas tienen un nombre y su canon para tocar en un show es de 1.000.000. Deben poder calcular su presupuesto y popularidad (¡datos importantes para que la productora pueda evaluar traer esa banda!). Su presupuesto es el canon más un posible gasto extra:
🤘 De las bandas de rock sabemos que siempre tienen un gasto extra de 10.000 y su popularidad es 100 veces la cantidad de solos de guitarra que tengan.
💎 Las bandas de trap no tienen un gasto extra y su popularidad depende de si tienen hielo o no. Si lo tienen, será 1000. Si no, 0. Además su canon es tantas veces su popularidad, siendo diferente al de las otras bandas ya que si no es nada popular, toca gratis para que lo conozcan. Por ejemplo, si la popularidad de Fácil B, un trapero, fuese 1.000 su canon sería 1.000.000.000.
🎙️ Sobre las bandas indies se sabe que su popularidad es 3,14 veces el largo del nombre de la banda y sus gastos extras son 500 por cada instrumento que tengan.

📋 Finalmente, desde la productora se quieren tener los siguientes reportes:
La ganancia total, que es la recaudación de las entradas compradas por los asistentes (no te preocupes por el descuento de los vip, ¡para eso están los sponsors!) restando el presupuesto de todas las bandas.
La cantidad de entradas vendidas.
La banda más popular, que es la que vendió más entradas.

Además, debe poder bonificar a los asistentes vip. Esto hace que el descuento propio de este abono aumente en 1%."

### Explicacion
Se decidio aplicar herencia ya que las bandas comparten comportamiento en comun como que todos calculan el presupuesto como cannon mas un precio extra. Lo que se modifica en las subclases es el precio extra. 
El cannon se decidio hacerlo como un metodo para poder modificarlo en las subclases (Trap). Para el cannon de Trap se entendio que es 1000000 (cannon base) * popularidad. Entonces, si la popularidad es 0 => el cannon es 0 y si la popularidad es 1000 => el cannon es 1000000000.
Para calcular la ganancia total se decidio calcular los activos por un lado y los pasivos por otro. Los activos se calculan sumando los gastos historicos de cada asistente, siendo el gasto historico (metodo en asistente por responsabilidad) de un asistente la suma de los precios de cada entrada comprada por el asistente sin el descuento. Los pasivos son la suma de los presupuestos de cada banda.
La cantidad total de entradas se calculo mediante un metodo que reune todas las listas de entradas de todos los asistentes en una lista. Una lista de listas. Luego se aplica flatten() para que sea solo una lista. Despues se le aplica size() para tener la cantidad de elementos
Para calcular la banda que mas entradas vendio se utilizo la lista del punto anterior, la lista de todas las entradas vendidas. luego con esa lista se filtran las entradas de una banda en especifica y se ve cuantas hay. Luego se utiliza max para, mediante el metodo anterior de las entradas por banda, ver cual es la banda de la lista de bandas que mas entradas vendio
El 1% se entendio como que se aniade a cada asistente con abono vip un 1% de descuento, quedando asi el precio final como precioFinal = precioSinDescuento * (1-descuento+0.01) siendo descuento un numero del 0 al 1.  
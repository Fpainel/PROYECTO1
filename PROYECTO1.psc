Algoritmo CalcularCostoZapatillas
	Definir precios Como Real
	Definir impuestos Como Real
	Definir descuentoCantidad1, descuentoCantidad2, descuentoCantidad3 como real
	Definir descuentoPrimeraCompra Como Real
	Definir costoEnvio Como Real
	Definir costoFinal1, costoFinal2, costoFinal3 Como Real
	Definir costoTotal Como Real
	Definir totalDescuento Como Real
	Definir totalImpuestos Como Real
	Definir destinoEnvio Como Cadena
	Definir pesoPaquete, paresZapatillasComprados Como Real
	Definir respuesta Como Cadena
	
	Dimension precios[3]
	
	Escribir "Ingrese el precio original del primer par de zapatillas:"
	Leer precios[1]
	
	respuesta <- "si"
	Mientras respuesta = "si" Hacer
		paresZapatillasComprados <- paresZapatillasComprados + 1
		
		Si paresZapatillasComprados < 3 Entonces
			Escribir "¿Desea comprar otro par de zapatillas? (si/no):"
			Leer respuesta
			
			Si respuesta = "si" Entonces
				Escribir "Ingrese el precio original del par de zapatillas ", paresZapatillasComprados + 1, ":"
				Leer precios[paresZapatillasComprados + 1]
			Fin Si
		Fin Si
	Fin Mientras
	
	Escribir "Se aplica un impuesto del 19% de IVA al precio original de las zapatillas."
	
	Escribir "¿Es su primera vez comprando en esta tienda? (si/no):"
	Leer respuesta
	Si respuesta = "si" Entonces
		descuentoPrimeraCompra <- 0.1
	Sino
		descuentoPrimeraCompra <- 0
	Fin Si
	
	Escribir "¿Ha comprado 2 o más pares de zapatillas? (si/no):"
	Leer respuesta
	Si respuesta = "si" Entonces
		descuentoCantidad1 <- 0.05
		descuentoCantidad2 <- 0.05
		descuentoCantidad3 <- 0.05
	Sino
		descuentoCantidad1 <- 0
		descuentoCantidad2 <- 0
		descuentoCantidad3 <- 0
	Fin Si
	
	Escribir "¿Prefiere envío o retiro en tienda? (envio/retiro):"
	Leer destinoEnvio
	
	Según destinoEnvio Hacer
Caso "envio":
	Escribir "Ingrese el peso del paquete (en kg):"
	Leer pesoPaquete
	
	Escribir "¿El envío es a Santiago o región? (santiago/region):"
	Leer respuesta
	Según respuesta Hacer
Caso "santiago":
	costoEnvio <- 10 + pesoPaquete * paresZapatillasComprados
De Otro Modo:
	costoEnvio <- 35 + pesoPaquete * paresZapatillasComprados
Fin Según
De Otro Modo:
	costoEnvio <- 0 
Fin Según

costoFinal1 <- precios[1] * (1 + 19 / 100) * (1 - descuentoPrimeraCompra) * (1 - descuentoCantidad1)
costoFinal2 <- precios[2] * (1 + 19 / 100) * (1 - descuentoPrimeraCompra) * (1 - descuentoCantidad2)
costoFinal3 <- precios[3] * (1 + 19 / 100) * (1 - descuentoPrimeraCompra) * (1 - descuentoCantidad3)

totalDescuento <- (precios[1] * descuentoPrimeraCompra + precios[2] * descuentoPrimeraCompra + precios[3] * descuentoPrimeraCompra) + (precios[1] * descuentoCantidad1 + precios[2] * descuentoCantidad2 + precios[3] * descuentoCantidad3)

totalImpuestos <- (precios[1] * 19 / 100) + (precios[2] * 19 / 100) + (precios[3] * 19 / 100)

costoTotal <- costoFinal1 + costoFinal2 + costoFinal3 + costoEnvio

Escribir "Costo total:", costoTotal
Escribir "Costo final del primer par de zapatillas:", costoFinal1
Escribir "Costo final del segundo par de zapatillas:", costoFinal2
Escribir "Costo final del tercer par de zapatillas:", costoFinal3
Escribir "Total de descuentos aplicados:", totalDescuento
Escribir "Total de impuestos aplicados:", totalImpuestos
Escribir "Costo de envío:", costoEnvio
Fin Algoritmo

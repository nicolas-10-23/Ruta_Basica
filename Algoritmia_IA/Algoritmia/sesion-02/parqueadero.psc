Proceso Parqueadero
	Definir vehiculo, factura Como Caracter
	Definir minutos, residuo, horasCobradas Como Entero
	Definir precio, tarifaHora, tmax, maxconfactura Como Real
	
	max <- 30000
	maxconfactura <- 15000
	
	Escribir "Que vehiculo es (moto o carro): "
	Leer vehiculo
	vehiculo <- Mayusculas(vehiculo)
	Escribir "Cuantos minutos estuvo en el parqueadero: "
	Leer minutos
	Escribir "Tiene factura? (S: Si, N: No): "
	Leer factura
	factura <- Mayusculas(factura)
	
	Si vehiculo <> "CARRO" y vehiculo <> "MOTO" Entonces
		Escribir "Vehiculo no valido"
	SiNo
		Si factura <> "S" y factura <> "N" Entonces
			Escribir "Respuesta de factura no valida"
		SiNo
			Si minutos < 0 Entonces
				Escribir "Minutos no validos"
			SiNo
				Si minutos <= 15 Entonces
					Escribir "Su parqueadero es gratis"
				SiNo
					Si vehiculo = "MOTO" Entonces
						tarifaHora <- 2000
					SiNo
						tarifaHora <- 4000
					FinSi
					
					horasCobradas <- trunc(minutos/60)
					residuo <- minutos mod 60
					Si residuo > 0 Entonces
						horasCobradas <- horasCobradas + 1
					FinSi
					precio <- horasCobradas * tarifaHora
					
					Si precio >= max Entonces
						Si factura = "S" Entonces
							precio <- maxconfactura
						SiNo
							precio <- max
						FinSi
					FinSi
					
					Escribir "Su precio es: ", precio
				FinSi
			FinSi
		FinSi
	FinSi
FinProceso
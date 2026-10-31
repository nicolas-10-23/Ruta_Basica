Proceso Semaforo
	Definir unidades Como Entero
	Definir rojo, amarillo, verde Como Caracter
	
	amarillo<- "pedir"
	rojo<- "agotado"
	verde<- "todo bien"
	
	Escribir "cuantas unidades hay : "
	Leer unidades
	
	si unidades < 0 Entonces
		Escribir "Error"
	SiNo
		si unidades = 0 Entonces
			Escribir rojo
		SiNo
			si unidades <= 10 Entonces
				Escribir amarillo
			sino 
				si unidades > 10 Entonces
					Escribir verde
				FinSi
			FinSi
		FinSi
	FinSi

	
FinProceso

Proceso Bisiesto
	Definir año Como Entero
	
	Escribir "ingrese el año"
	Leer año
	
	si (año mod 4 = 0 y año mod 100 <> 0) o año mod 400 = 0 Entonces
		Escribir año, "es bisiesto"
	sino 
		Escribir año, "no es bisiesto"
	FinSi
FinProceso

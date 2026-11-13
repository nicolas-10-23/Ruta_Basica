Algoritmo ValidarPIN
	Definir pin,intentos Como Entero
	Definir acceso Como Logico
	intentos <- 0
	acceso <- Falso
	
	Repetir
		Escribir "Ingresa tu PIN de 4 digitos:  "
		Leer pin
		intentos <- intentos + 1
		
		si pin = 6190 Entonces
			acceso <- Verdadero
		sino 
			Escribir "Pin incorrecto"
		FinSi
		
	Hasta Que acceso o intentos = 3
	si acceso Entonces
		Escribir "Welcome"
	SiNo
		Escribir "Tarjeta bloqueada"
	FinSi
FinAlgoritmo

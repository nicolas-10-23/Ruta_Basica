Proceso ValidarRegistro
	Definir edad Como Entero
	Definir  respuesta Como Caracter
	
	Escribir "Cuantos años tienes? :"
	Leer edad
	
	Escribir "Aceptas los terminos y condiciones? (S/N):"
	Leer respuesta
	
	Si edad >= 14 Y respuesta = "S" Entonces
		
		Escribir "Resgistro exitoso :)"
	SiNo
		Escribir "No puedes registrarte :("
		
	FinSi
FinProceso

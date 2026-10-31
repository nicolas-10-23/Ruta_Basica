Proceso ValidarEdad
	
	Definir edad Como Entero
	
	Escribir "Ingrese su edad:"
	Leer edad
	
	Si edad < 0 o edad > 120 Entonces
		Escribir "Su edad es invalida"
		
	SiNo
		Escribir "Su edad es valida"
	FinSi
FinProceso

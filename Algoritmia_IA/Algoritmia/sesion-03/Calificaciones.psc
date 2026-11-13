Algoritmo Calificaciones
	Definir nota, promedio, menor, mayor Como Real
	Definir aprobados, i Como Entero
	Definir reprobados Como Logico
	promedio <- 0
	menor <- 5
	mayor <- 0
	aprobados <- 0
	reprobados <- Falso
	
	Para i<-1 Hasta 5 Hacer
		Escribir "Ingrese la nota del estudiante ", i, ":"
		Leer nota
		
		promedio <- promedio + nota
		
		si nota >= 3 Entonces
			aprobados <- aprobados + 1
		SiNo
			reprobados <- Verdadero
		FinSi
		
		si nota > mayor Entonces
			mayor <- nota
		sino 
			si nota < menor 
				menor <- nota
			FinSi
		FinSi
	FinPara
	
	Escribir "Promedio ", (promedio / 5)
	Escribir  "Aprobados: ", aprobados
	Escribir  "Nota mas alta: ", mayor, " y mas baja", menor
	si reprobados Entonces
		Escribir  "Hay estudiantes reprobados"
	FinSi
	
FinAlgoritmo

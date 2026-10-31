Algoritmo PromedioNotas
	Definir nota1, nota2, nota3, promedio, promedio_2dec Como Real
	Escribir 'ingrese su nota 1'
	Leer nota1
	Escribir 'ingrese su nota 2'
	Leer nota2
	Escribir 'ingrese su nota 3'
	Leer nota3
	promedio <- (nota1+nota2+nota3)/3
	promedio_2dec <- Redon(promedio*100)/100
	Escribir 'Su promedio es :', promedio_2dec
FinAlgoritmo

Algoritmo Propinas
	Definir cuenta, personas, propina, total, pagoindi Como Entero
	Definir porcentajeprop Como Real
	Escribir 'Cuantas personas son'
	Leer personas
	Escribir 'Cual es el valor de la cuenta'
	Leer cuenta
	Escribir 'Cual es el % de propina'
	Leer porcentajeprop
	propina <- (cuenta*porcentajeprop)/100
	total <- cuenta+propina
	pagoindi <- total/personas
	Escribir 'El paga de cada uno debe ser de ', pagoindi, ', la propina que se debe dar es', propina, ' y el total a pagar es ', total
FinAlgoritmo

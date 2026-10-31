# Tablas de verdad y pruebas de escritorio en PSeInt

`V` = verdadero, `F` = falso, `—` = no se evalúa (no se llega a ese paso).

---

## 1. Año bisiesto (`Bisiesto.psc`)

```
(año mod 4 = 0 y año mod 100 <> 0) o año mod 400 = 0
```

- **A:** `año mod 4 = 0`
- **B:** `año mod 100 <> 0`
- **C:** `año mod 400 = 0`

Expresión: **(A ∧ B) ∨ C**

### Tabla de verdad

| A | B | C | A ∧ B | (A ∧ B) ∨ C | Resultado | ¿Combinación posible? | Ejemplo |
|---|---|---|-------|-------------|-----------|-----------------------|---------|
| F | F | F | F | F | No es bisiesto | No | — |
| F | F | V | F | V | Es bisiesto | No | — |
| F | V | F | F | F | No es bisiesto | Sí | 2026 |
| F | V | V | F | V | Es bisiesto | No | — |
| V | F | F | F | F | No es bisiesto | Sí | 1900 |
| V | F | V | F | V | Es bisiesto | Sí | 2000 |
| V | V | F | V | V | Es bisiesto | Sí | 2024 |
| V | V | V | V | V | Es bisiesto | No | — |

### Prueba de escritorio

| Caso | año | año mod 4 | año mod 100 | año mod 400 | A | B | C | A ∧ B | (A ∧ B) ∨ C | Salida |
|------|-----|-----------|-------------|-------------|---|---|---|-------|-------------|--------|
| 1 | 2024 | 0 | 24 | 24 | V | V | F | V | V | `2024es bisiesto` |
| 2 | 1900 | 0 | 0 | 300 | V | F | F | F | F | `1900no es bisiesto` |
| 3 | 2000 | 0 | 0 | 0 | V | F | V | F | V | `2000es bisiesto` |
| 4 | 2026 | 2 | 26 | 26 | F | V | F | F | F | `2026no es bisiesto` |

---

## 2. Semáforo de inventario (`Semaforo.psc`)

Variables fijas: `rojo = "agotado"`, `amarillo = "pedir"`, `verde = "todo bien"`.

### Tabla de verdad

| unidades | `unidades < 0` | `unidades = 0` | `unidades <= 10` | `unidades > 10` | Salida |
|----------|----------------|----------------|------------------|-----------------|--------|
| -1 | V | — | — | — | Error |
| 0 | F | V | — | — | agotado |
| 1 | F | F | V | — | pedir |
| 10 | F | F | V | — | pedir |
| 11 | F | F | F | V | todo bien |

### Prueba de escritorio

| Caso | unidades | amarillo | rojo | verde | Decisión | Salida |
|------|----------|----------|------|-------|----------|--------|
| 1 | -1 | pedir | agotado | todo bien | `-1 < 0` es V | `Error` |
| 2 | 0 | pedir | agotado | todo bien | `0 < 0` F, `0 = 0` V | `agotado` |
| 3 | 1 | pedir | agotado | todo bien | `1 < 0` F, `1 = 0` F, `1 <= 10` V | `pedir` |
| 4 | 10 | pedir | agotado | todo bien | `10 <= 10` V | `pedir` |
| 5 | 11 | pedir | agotado | todo bien | `11 <= 10` F, `11 > 10` V | `todo bien` |

---

## 3. Parqueadero (`parqueadero.psc`)

Constantes: `max = 30000`, `maxconfactura = 15000`. Tarifa: moto 2000/h, carro 4000/h.

| Id | Condición |
|----|-----------|
| C1 | `vehiculo <> "CARRO" y vehiculo <> "MOTO"` (vehículo no válido) |
| C2 | `factura <> "S" y factura <> "N"` (factura no válida) |
| C3 | `minutos < 0` |
| C4 | `minutos <= 15` |
| C5 | `precio >= max` |

### Tabla de verdad de C1

a = `vehiculo <> "CARRO"`, b = `vehiculo <> "MOTO"`

| a | b | C1 = a ∧ b | Significado |
|---|---|-----------|-------------|
| V | V | V | Vehículo inválido |
| V | F | F | MOTO |
| F | V | F | CARRO |
| F | F | F | Imposible |

### Tabla de verdad de C2

a = `factura <> "S"`, b = `factura <> "N"`

| a | b | C2 = a ∧ b | Significado |
|---|---|-----------|-------------|
| V | V | V | Factura inválida |
| V | F | F | N |
| F | V | F | S |
| F | F | F | Imposible |

### Tabla de verdad del tope (C5)

| `precio >= max` | factura | Precio final |
|-----------------|---------|--------------|
| V | S | `maxconfactura` = 15000 |
| V | N | `max` = 30000 |
| F | S o N | precio calculado |

### Evaluación de condiciones por caso

| # | Entrada (vehículo, minutos, factura) | C1 | C2 | C3 | C4 | C5 | Resultado |
|---|--------------------------------------|----|----|----|----|----|-----------|
| 1 | carro, 15, N | F | F | F | V | — | Gratis |
| 2 | carro, 16, N | F | F | F | F | F | 4000 |
| 3 | carro, 60, N | F | F | F | F | F | 4000 |
| 4 | carro, 61, N | F | F | F | F | F | 8000 |
| 5 | moto, 61, S | F | F | F | F | F | 4000 |
| 6 | carro, 600, N | F | F | F | F | V | 30000 |
| 7 | carro, 600, S | F | F | F | F | V | 15000 |
| 8 | 3, 30, N | V | — | — | — | — | Vehiculo no valido |
| 9 | carro, -5, N | F | F | V | — | — | Minutos no validos |

### Prueba de escritorio

| # | vehiculo | minutos | factura | tarifaHora | trunc(minutos/60) | residuo | horasCobradas | precio | ¿precio >= max? | Salida |
|---|----------|---------|---------|------------|-------------------|---------|---------------|--------|-----------------|--------|
| 1 | CARRO | 15 | N | — | — | — | — | — | — | `Su parqueadero es gratis` |
| 2 | CARRO | 16 | N | 4000 | 0 | 16 | 0 + 1 = 1 | 4000 | F | `Su precio es: 4000` |
| 3 | CARRO | 60 | N | 4000 | 1 | 0 | 1 | 4000 | F | `Su precio es: 4000` |
| 4 | CARRO | 61 | N | 4000 | 1 | 1 | 1 + 1 = 2 | 8000 | F | `Su precio es: 8000` |
| 5 | MOTO | 61 | S | 2000 | 1 | 1 | 1 + 1 = 2 | 4000 | F | `Su precio es: 4000` |
| 6 | CARRO | 600 | N | 4000 | 10 | 0 | 10 | 40000 → 30000 | V, factura N → `max` | `Su precio es: 30000` |
| 7 | CARRO | 600 | S | 4000 | 10 | 0 | 10 | 40000 → 15000 | V, factura S → `maxconfactura` | `Su precio es: 15000` |
| 8 | 3 | 30 | N | — | — | — | — | — | — | `Vehiculo no valido` |
| 9 | CARRO | -5 | N | — | — | — | — | — | — | `Minutos no validos` |

---

## 4. Validar registro (`ValidarRegistro.psc`)

```
edad >= 14 Y respuesta = "S"
```

- **A:** `edad >= 14`
- **B:** `respuesta = "S"`

Expresión: **A ∧ B**

### Tabla de verdad

| A | B | A ∧ B | Salida | Ejemplo |
|---|---|-------|--------|---------|
| V | V | V | Resgistro exitoso :) | (14, S) |
| V | F | F | No puedes registrarte :( | (30, N) |
| F | V | F | No puedes registrarte :( | (13, S) |
| F | F | F | No puedes registrarte :( | (13, N) |

### Prueba de escritorio

| Caso | edad | respuesta | A | B | A ∧ B | Salida |
|------|------|-----------|---|---|-------|--------|
| 1 | 14 | S | V | V | V | `Resgistro exitoso :)` |
| 2 | 13 | S | F | V | F | `No puedes registrarte :(` |
| 3 | 30 | N | V | F | F | `No puedes registrarte :(` |
| 4 | 14 | S | V | V | V | `Resgistro exitoso :)` |

---

## 5. Validar edad (`ValidarEdad.psc`)

```
edad < 0 o edad > 120
```

- **A:** `edad < 0`
- **B:** `edad > 120`

Expresión: **A ∨ B** (si es V, la edad es inválida)

### Tabla de verdad

| A | B | A ∨ B | Salida | Ejemplo |
|---|---|-------|--------|---------|
| F | F | F | Su edad es valida | 0, 120 |
| F | V | V | Su edad es invalida | 121 |
| V | F | V | Su edad es invalida | -1 |
| V | V | V | Su edad es invalida | Imposible |

### Prueba de escritorio

| Caso | edad | A (`edad < 0`) | B (`edad > 120`) | A ∨ B | Salida |
|------|------|----------------|------------------|-------|--------|
| 1 | -1 | V | F | V | `Su edad es invalida` |
| 2 | 0 | F | F | F | `Su edad es valida` |
| 3 | 120 | F | F | F | `Su edad es valida` |
| 4 | 121 | F | V | V | `Su edad es invalida` |

# Farkle TP - Programación 1 (2026)

Trabajo Práctico de la materia **Programación 1** - Implementación del juego de dados **Farkle** en R.

## Integrantes del grupo

- Vazquez, Santos Nicolás - Comisión 4A
- Morello, Nino Julián - Comisión 2A
- Mengarelli, Luca Franco - Comisión 1B

## Asignaciones

| Función | Responsable | Archivo | Estado |
|---|---|---|---|
| ~~`calcular_puntaje_tirada`~~ | Nino | `funciones.R` | ~~Hecho~~ |
| `ejecutar_turno` | Nino | `funciones.R` | |
| ~~`dados_sin_puntaje`~~ | Luca | `funciones.R` | ~~Hecho~~ |
| ~~`mostrar_tabla`~~ | Nico | `interfaz.R` | ~~Hecho~~ |
| ~~`pantalla_inicio`~~ | Nico | `interfaz.R` | ~~Hecho~~ |
| ~~`jugar.R`~~ | Luca | `jugar.R` | ~~Hecho~~ |

## Cómo ejecutar

Desde la terminal, situarse en este directorio y correr:

```bash
Rscript jugar.R
```

## Estructura del proyecto

```
├── jugar.R        # Script principal (punto de entrada)
├── funciones.R    # Funciones del juego: calcular_puntaje_tirada, dados_sin_puntaje, ejecutar_turno
├── interfaz.R     # Funciones de interfaz: pantalla_inicio, mostrar_tabla
└── README.md
```

> **Nota:** Las funciones `pantalla_inicio` y `mostrar_tabla` fueron implementadas por Nico
> en `interfaz.R` en lugar de `funciones.R`. El archivo `jugar.R` carga ambos archivos con
> `source()`, por lo que el juego funciona correctamente. Las funciones siguen estando
> disponibles de la misma manera para el resto del código.

## Instalación del paquete `farkle`

Correr **una sola vez** antes de ejecutar el programa:

```r
install.packages("pak")
pak::pkg_install("ee-unr/programacion-1/tp/farkle")
```

## Reglas del juego

- Se juega entre **dos jugadores**, por turnos.
- En cada turno se lanzan **5 dados**.
- Cada **1** suma 100 puntos; cada **5** suma 50 puntos.
- Los dados que muestran 1 o 5 se retiran; con los restantes se puede seguir tirando o detenerse.
- Si ningún dado muestra 1 o 5, el turno termina y se pierden los puntos acumulados en ese turno.
- Si todos los dados son retirados, se puede volver a tirar con 5 dados manteniendo el puntaje del turno.
- **Gana el primero en llegar exactamente a 1000 puntos.** Si se supera ese número, no se suman los puntos del turno.



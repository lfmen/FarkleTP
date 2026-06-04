# Trabajo Práctico de la materia **Programación 1** - Implementación del juego de dados **Farkle** en R.

## Grupo Nº 12

## Integrantes del grupo

- Vazquez, Santos Nicolás - Comisión 4A
- Morello, Nino Julián - Comisión 2A
- Mengarelli, Luca Franco - Comisión 1B

## Organización del grupo

Usamos **GitHub** como repositorio compartido. Documentamos todo en el README para tener el proyecto más ordenado y prolijo.

División del trabajo por archivo:

### `funciones.R`

| Función | Responsable |
|---|---|
| `calcular_puntaje_tirada` | Nino Morello |
| `dados_sin_puntaje` | Luca Mengarelli |
| `ejecutar_turno` | Nino Morello |

### `interfaz.R`

| Función | Responsable |
|---|---|
| `pantalla_inicio` | Nicolás Vazquez |
| `mostrar_puntaje` | Nicolás Vazquez |
| `mostrar_turno` | Nicolás Vazquez |

### `jugar.R`

| Sección | Responsable |
|---|---|
| Programa principal (bucle de rondas, lógica de fin de juego) | Luca Mengarelli |

### `README.md`

| Sección | Responsable |
|---|---|
| Redacción y documentación | Luca Mengarelli |

## Cómo ejecutar

Desde la terminal, situarse en este directorio y correr:

```bash
Rscript jugar.R
```

## Estructura del proyecto

```
├── jugar.R        # Script principal (punto de entrada)
├── funciones.R    # Funciones del juego: calcular_puntaje_tirada, dados_sin_puntaje, ejecutar_turno
├── interfaz.R     # Funciones de interfaz: pantalla_inicio, mostrar_puntaje, mostrar_turno
└── README.md
```

## Decisiones de diseño

- **Modularización:** Separamos el código en `interfaz.R` (para lo visual) y `funciones.R` (para la lógica) así el script principal (`jugar.R`) queda mucho más corto y ordenado.
- **Estilo del título:** Diseñamos el título principal usando *ASCII art* para darle una mejor estética y lograr una presentación más atractiva al iniciar.

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




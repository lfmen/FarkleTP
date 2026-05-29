# Farkle TP - Programación 1 (2026)

Trabajo Práctico de la materia **Programación 1** - Implementación del juego de dados **Farkle** en R.

## Integrantes del grupo

- Vazquez, Santos Nicolás - Comisión 4A
- Morello, Nino Julián - Comisión 2A
- Mengarelli, Luca Franco - Comisión 1B

## Organización del grupo

Usamos **GitHub** como repositorio compartido. Cada uno trabajó en su propia rama y fue integrando los cambios del resto.

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
| `mostrar_tabla` | Nicolás Vazquez |
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
├── interfaz.R     # Funciones de interfaz: pantalla_inicio, mostrar_tabla
└── README.md
```

> **Nota:** Se decidió separar las funciones de interfaz en un archivo propio (`interfaz.R`) para
> mantener el código más organizado y limpio. De esta forma, `funciones.R` concentra exclusivamente
> la lógica del juego, mientras que todo lo relacionado con la presentación en pantalla queda
> agrupado en un único lugar. El archivo `jugar.R` carga ambos con `source()`, por lo que el
> funcionamiento del programa no se ve afectado.

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

## Decisiones de diseño

- **Tres archivos separados:** `funciones.R` tiene la lógica, `interfaz.R` la presentación y `jugar.R` es el punto de entrada. Así cada parte tiene su lugar y es más fácil trabajar sin pisarse entre integrantes.
- **Convenciones unificadas:** Usamos snake_case e igual estilo de documentación en todo el proyecto para que el código sea consistente.
- **`source()` para cargar archivos:** Es la forma más directa para un proyecto de esta escala.

## Aclaraciones para el corrector

- El único archivo a ejecutar es `jugar.R`. Los otros dos los carga automáticamente con `source()`.
- El paquete `farkle` hay que instalarlo una sola vez antes de correr el programa (ver sección de instalación).
- Corre completamente en consola, sin interfaz gráfica.

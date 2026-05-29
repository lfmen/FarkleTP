#-------------------------------------------------------------------------------
#       PROGRAMACIÓN 1 - TRABAJO PRÁCTICO - AÑO 2026
#-------------------------------------------------------------------------------
#
# GRUPO Nº 12:
#
# - Vazquez, Santos Nicolás - Comisión 4A
# - Morello, Nino Julián - Comisión 2A
# - Mengarelli, Luca Franco - Comisión 1B
#
# ARCHIVO: jugar.R
#
# Este archivo debe ser ejecutado desde una terminal con la instrucción Rscript
# jugar.R, desde el directorio en el que esté guardado junto con cualquier otro
# archivo que sea creado como parte de la solución.
#
# Las funciones de interfaz (pantalla_inicio, mostrar_tabla) fueron
# implementadas por Nico en interfaz.R y se cargan desde ahí.
#
# RESPONSABLE: Luca Mengarelli
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Paquete "farkle"
#-------------------------------------------------------------------------------

# Instalación (correr una sola vez): ver README.

library("farkle")

#-------------------------------------------------------------------------------
# Carga de funciones propias
#-------------------------------------------------------------------------------

source("funciones.R")   # Funciones del juego
source("interfaz.R")    # Funciones de interfaz (Nico)

#-------------------------------------------------------------------------------
# Programa principal
#-------------------------------------------------------------------------------

# Puntaje objetivo para ganar
puntaje_maximo <- 1000

# ---- Pantalla de inicio: leer nombres de jugadores ----
nombres <- pantalla_inicio()
nombre1 <- nombres[1]
nombre2 <- nombres[2]

# ---- Inicializar puntajes totales ----
puntaje1 <- 0
puntaje2 <- 0

# ---- Bucle principal: rondas del juego ----
ronda <- 1
juego_activo <- TRUE

while (juego_activo) {

  limpiar_consola()
  titulo(paste("RONDA", ronda))
  mostrar_tabla(nombre1, nombre2, puntaje1, puntaje2)

  opcion_ronda <- leer_opciones(
    "Elegí una opción:",
    "Comenzar la ronda",
    "Salir del juego"
  )

  if (opcion_ronda == 2) {
    cat("\n¡Hasta la próxima!\n")
    juego_activo <- FALSE
  } else {

    # ---- Turno del jugador 1 ----
    limpiar_consola()
    ganados1 <- ejecutar_turno(nombre1, puntaje1, puntaje_maximo)
    puntaje1 <- puntaje1 + ganados1

    # ---- Turno del jugador 2 ----
    limpiar_consola()
    ganados2 <- ejecutar_turno(nombre2, puntaje2, puntaje_maximo)
    puntaje2 <- puntaje2 + ganados2

    # ---- Verificar fin del juego ----
    limpiar_consola()

    if (puntaje1 == puntaje_maximo && puntaje2 == puntaje_maximo) {
      # Empate: ambos llegaron a 1000 en la misma ronda
      titulo("¡EMPATE!")
      cat("\nAmbos jugadores llegaron a", puntaje_maximo, "puntos en la misma ronda.\n")
      mostrar_tabla(nombre1, nombre2, puntaje1, puntaje2)
      juego_activo <- FALSE

    } else if (puntaje1 == puntaje_maximo) {
      # Ganó el jugador 1
      titulo(paste("¡GANA", nombre1, "!"))
      mostrar_tabla(nombre1, nombre2, puntaje1, puntaje2)
      juego_activo <- FALSE

    } else if (puntaje2 == puntaje_maximo) {
      # Ganó el jugador 2
      titulo(paste("¡GANA", nombre2, "!"))
      mostrar_tabla(nombre1, nombre2, puntaje1, puntaje2)
      juego_activo <- FALSE

    } else {
      # La partida continúa: mostrar resumen de la ronda y avanzar
      titulo(paste("FIN DE LA RONDA", ronda))
      mostrar_tabla(nombre1, nombre2, puntaje1, puntaje2)
      pausa()
      ronda <- ronda + 1
    }
  }
}

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
# ARCHIVO: funciones.R
#
# Este archivo contiene todas las funciones auxiliares del juego Farkle.
# Se carga desde jugar.R con source("funciones.R").
#-------------------------------------------------------------------------------


# ==============================================================================
# RESPONSABLE: Nino
# ==============================================================================

#' Calcula el puntaje obtenido en una tirada
#'
#' @param tirada Vector numérico con los resultados de los dados tirados.
#' @return Número entero con el puntaje total de la tirada.
#' @return 0 si no hay puntaje que sumar.
calcular_puntaje_tirada <- function(tirada) {
  puntaje <- 0
  for (i in 1:length(tirada)) {
    if (tirada[i] == 1) {
      puntaje <- puntaje + 100
    }
    if (tirada[i] == 5) {
      puntaje <- puntaje + 50
    }
  }
  if (puntaje == 0) { return(0) }
  return(puntaje)
}


# ==============================================================================
# RESPONSABLE: Luca
# ==============================================================================

#' Cuenta cuántos dados de una tirada no suman puntos
#'
#' @param tirada Vector numérico con los resultados de los dados tirados.
#' @return Vector numérico con los dados que no suman puntos.
dados_sin_puntaje <- function(tirada) {
  restantes <- c()
  for (dado in tirada) {
    if (dado != 1 && dado != 5) {
      restantes <- c(restantes, dado)
    }
  }
  return(restantes)
}



# ==============================================================================
# RESPONSABLE: Nino
# ==============================================================================

#' Ejecuta el turno completo de un jugador
#'
#' @param nombre Cadena de texto con el nombre del jugador.
#' @param puntaje_total Número con el puntaje total acumulado del jugador.
#' @param puntaje_maximo Número con el puntaje objetivo del juego (1000).
#' @return Número con los puntos ganados en este turno (0 si perdió el turno).
ejecutar_turno <- function(nombre, puntaje_total, puntaje_maximo) {
  # TODO (Nino):
  # - Inicializar puntaje del turno en 0 y dados disponibles en 5
  # - Entrar en un bucle que se repite mientras el turno esté activo:
  #     * Mostrar información del turno (nombre, puntaje total, dados disponibles, puntos acumulados)
  #     * Preguntar al jugador si quiere tirar o terminar el turno (usar leer_opciones())
  #     * Si elige terminar: retornar el puntaje acumulado en el turno
  #     * Si elige tirar:
  #         - Tirar los dados disponibles (usar tirar_dados())
  #         - Mostrar los dados (usar mostrar_dados())
  #         - Calcular el puntaje de la tirada (usar calcular_puntaje_tirada())
  #         - Si el puntaje es 0: avisar que perdió los puntos del turno y retornar 0
  #         - Si el puntaje es mayor a 0: sumarlo al puntaje del turno
  #         - Si el puntaje total + puntaje del turno supera el máximo: avisar y retornar 0
  #         - Calcular los dados que no sumaron (usar dados_sin_puntaje())
  #         - Si quedaron 0 dados: avisar que puede reiniciar con 5 dados y preguntar si quiere
  #         - Si quedaron dados: continuar el bucle con esos dados
}


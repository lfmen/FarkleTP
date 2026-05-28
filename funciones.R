#-------------------------------------------------------------------------------
#       PROGRAMACIÓN 1 - TRABAJO PRÁCTICO - AÑO 2026
#-------------------------------------------------------------------------------
#
# GRUPO Nº 12:
#
# - Vazquez, Santos Nicolás
# - Morello, Nino Julián
# - Mengarelli, Luca Franco
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
# RESPONSABLE: Nico
# ==============================================================================

#' Muestra la tabla de puntajes actuales de ambos jugadores
#'
#' @param nombre1 Cadena de texto con el nombre del jugador 1.
#' @param nombre2 Cadena de texto con el nombre del jugador 2.
#' @param puntaje1 Número con el puntaje total del jugador 1.
#' @param puntaje2 Número con el puntaje total del jugador 2.
mostrar_tabla <- function(nombre1, nombre2, puntaje1, puntaje2) {
  # TODO (Nico):
  # - Imprimir una tabla con los nombres y puntajes de ambos jugadores
  # - Usar cat() para mostrar el texto en pantalla
  # - Formato sugerido: una línea por jugador, con nombre y puntaje alineados
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


# ==============================================================================
# RESPONSABLE: Nico
# ==============================================================================

#' Muestra la pantalla de inicio y lee los nombres de los jugadores
#'
#' @return Vector de caracteres con los dos nombres ingresados.
pantalla_inicio <- function() {
  # TODO (Nico):
  # - Limpiar la consola (usar limpiar_consola())
  # - Mostrar el título del juego (usar titulo())
  # - Mostrar las reglas del juego con texto_lento() o cat()
  #     * Cada jugador tira 5 dados
  #     * Dado con 1 = 100 puntos, dado con 5 = 50 puntos
  #     * Si ningún dado suma, se pierden los puntos del turno
  #     * Si te pasás de 1000, se pierden los puntos del turno
  #     * Si todos los dados sumaron, se puede volver a tirar con 5 dados
  #     * Gana el primero en llegar a 1000 puntos
  # - Pedir el nombre del jugador 1 (usar leer_palabra())
  # - Pedir el nombre del jugador 2 (usar leer_palabra())
  # - Retornar un vector con los dos nombres: c(nombre1, nombre2)
}

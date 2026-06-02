#-------------------------------------------------------------------------------
#       PROGRAMACION 1 - TRABAJO PRACTICO - ANO 2026
#-------------------------------------------------------------------------------
#
# GRUPO N 12:
#
# - Vazquez, Santos Nicolas - Comision 4A
# - Morello, Nino Julian - Comision 2A
# - Mengarelli, Luca Franco - Comision 1B
#
# ARCHIVO: funciones.R
#
# Este archivo contiene las funciones auxiliares del juego Farkle.
# Se carga desde jugar.R con source("funciones.R").
#-------------------------------------------------------------------------------


# ==============================================================================
# RESPONSABLE: calcular_puntaje_tirada
# ==============================================================================

#' Calcula el puntaje obtenido en una tirada
#'
#' @param tirada Vector numerico con los resultados de los dados tirados.
#' @return Numero entero con el puntaje total de la tirada, o 0 si ningun dado suma puntos.
calcular_puntaje_tirada <- function(tirada) {
  if (length(tirada) == 0) {
    return(0)
  }

  puntaje <- 0
  for (i in 1:length(tirada)) {
    if (tirada[i] == 1) {
      puntaje <- puntaje + 100
    }
    if (tirada[i] == 5) {
      puntaje <- puntaje + 50
    }
  }

  return(puntaje)
}


# ==============================================================================
# RESPONSABLE: dados_sin_puntaje
# ==============================================================================

#' Cuenta cuantos dados de una tirada no suman puntos
#'
#' @param tirada Vector numerico con los resultados de los dados tirados.
#' @return Vector numerico con los dados que no suman puntos.
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
# RESPONSABLE: ejecutar_turno
# ==============================================================================

#' Ejecuta el turno completo de un jugador
#'
#' @param nombre Cadena de texto con el nombre del jugador.
#' @param puntaje_total Numero con el puntaje total acumulado del jugador.
#' @param puntaje_maximo Numero con el puntaje objetivo del juego.
#' @return Numero con los puntos ganados en este turno (0 si perdio el turno).
ejecutar_turno <- function(nombre, puntaje_total, puntaje_maximo) {
  puntaje_acumulado <- 0
  dados <- 5
  suertudo <- FALSE

  while (TRUE) {
    if (dados != 5 || suertudo) {
      decision <- leer_opciones("¿Tirar dados?", "Si", "No")
    } else {
      decision <- leer_opciones("¿Tirar dados?", "Si", "Pasar turno")
    }

    if (decision == 2) {
      return(puntaje_acumulado)
    }

    tirada <- tirar_dados(dados)
    puntaje_tirada <- calcular_puntaje_tirada(tirada)

    if (puntaje_tirada == 0) {
      texto_lento("No te salio nada. Tremendo perdedor")
      return(0)
    }

    puntaje_acumulado <- puntaje_acumulado + puntaje_tirada

    if (puntaje_total + puntaje_acumulado > puntaje_maximo) {
      texto_lento("Superaste el puntaje maximo. Perdiste el turno.")
      return(0)
    }

    dados <- length(dados_sin_puntaje(tirada))

    if (dados == 0) {
      suertudo <- TRUE
      dados <- 5
    }

    texto_lento(
      "Dados:",
      mostrar_dados(tirada),
      "sacaste",
      puntaje_tirada,
      "puntaje acumulado =",
      puntaje_acumulado
    )
  }
}

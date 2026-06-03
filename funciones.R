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
# RESPONSABLE: Nino Morello
# FUNCION: calcular_puntaje_tirada
# ==============================================================================

#' Calcula el puntaje obtenido en una tirada
#'
#' @param tirada Vector numérico con los resultados de los dados tirados.
#' @return Número entero con el puntaje total de la tirada, o 0 si ningún dado suma puntos.
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
  acumulado <- puntaje
  return(acumulado)
}


# ==============================================================================
# RESPONSABLE: Luca Mengarelli
# FUNCION: dados_sin_puntaje
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
# RESPONSABLE: Nino Morello
# FUNCION: ejecutar_turno
# ==============================================================================

#' Ejecuta el turno completo de un jugador
#'
#' @param nombre Cadena de texto con el nombre del jugador.
#' @param puntaje_total Número con el puntaje total acumulado del jugador.
#' @param puntaje_maximo Número con el puntaje objetivo del juego (1000).
#' @return Número con los puntos ganados en este turno (0 si perdió el turno).
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
    
    if (calcular_puntaje_tirada(tirada) == 0) { 
      texto_lento("No te salió nada. Perdiste el turno.\n") 
      pausa()
      return(0)
    } else {
      puntaje_acumulado <- puntaje_acumulado + calcular_puntaje_tirada(tirada)
      dados <- length(dados_sin_puntaje(tirada))
    }
    
    if (puntaje_total + puntaje_acumulado > puntaje_maximo) {
      texto_lento("Te pasaste del puntaje máximo. Perdiste el turno.\n")
      pausa()
      return(0)
    }
    
    if (dados == 0) {
      suertudo <- TRUE
      dados <- 5
    } else {
      suertudo <- FALSE
    }
    
    texto_lento(mostrar_dados(tirada), "\nSacaste", calcular_puntaje_tirada(tirada), "puntos\n",
                "Puntaje acumulado =", puntaje_acumulado, "\n")
  }
}

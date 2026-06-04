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
  for (dado in tirada) {
    if (dado == 1) {
      puntaje <- puntaje + 100
    } 
    if (dado == 5) {
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
    if (dado != 1 & dado != 5) {
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
  cant_tiradas <- 0
  
  while (TRUE) {
    
    titulo(paste0("Turno de ", nombre, " con ", puntaje_total, " puntos"))
    mostrar_turno(cant_tiradas, puntaje_acumulado, dados)
    cat("\n")
    
    if (cant_tiradas > 0) {
      decision <- leer_opciones("¿Tirar dados?", "Si", "No")
      
      if (decision == 2) {
        return(puntaje_acumulado)
      }
    } else {
      pausa("Primer lanzamiento del turno.")
    }
    
    tirada <- tirar_dados(dados)
    
    texto_lento("\nSalieron los siguientes dados:\n", mostrar_dados(tirada), pausa = 0.003) 
    
    puntaje_tirada <- calcular_puntaje_tirada(tirada)
    
    if (puntaje_tirada == 0) { 
      texto_lento("No te salió ni 5 ni 1. Perdiste todos los puntos acumulados en este turno.\n", pausa = 0.003) 
      pausa("")
      return(0)
    } else {
      puntaje_acumulado <- puntaje_acumulado + puntaje_tirada
      dados <- length(dados_sin_puntaje(tirada))
    }
    
    if (puntaje_total + puntaje_acumulado > puntaje_maximo) {
      texto_lento("Te pasaste del puntaje máximo. Puntos acumulados perdidos.\n", pausa = 0.003)
      pausa("")
      return(0)
    }
    
    cant_tiradas <- cant_tiradas + 1
    
    texto_lento("\nSacaste", puntaje_tirada, "puntos\n", pausa = 0.003)

    if (dados == 0) {
      dados <- 5
      texto_lento("\n* ¡Usaste todos los dados! Podés volver a tirar con 5 dados.\n", pausa = 0.003)
    }
    
    pausa("")
    limpiar_consola()
  }
}

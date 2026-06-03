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
# ARCHIVO: interfaz.R
#
# Este archivo contiene las funciones de interfaz de usuario del juego Farkle.
# Se carga desde jugar.R con source("interfaz.R").
#
# RESPONSABLE: Nicolás Vazquez
# FUNCIONES: pantalla_inicio, mostrar_tabla, mostrar_turno
#-------------------------------------------------------------------------------

#' Muestra la pantalla de inicio y lee los nombres de los jugadores
#'
#' @return Vector de caracteres con los dos nombres ingresados.
pantalla_inicio <- function() {
  # Limpiar consola
  limpiar_consola()
  
  # Mostrar título
  titulo("##################### FARKLE - El juego de dados #####################")
  
  # Mensaje de bienvenida y reglas del juego
  texto_lento(" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BIENVENIDOS!!! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n
  « Farkle es un juego de dados de estrategia y gestión de riesgo en el que dos
  jugadores compiten por alcanzar el puntaje máximo de 1000 puntos antes que su
  rival. »
  « La partida se desarrolla a lo largo de múltiples rondas. En cada una de 
  estas rondas, los jugadores participan por turnos respetando un orden. Dentro 
  de su turno, cada jugador puede lanzar los dados una o más veces, dependiendo
  del resultado de cada tirada. » \n" , pausa = 0.005)
  texto_lento(" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ REGLAS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n
  ∙ Cada jugador comienza lanzando cinco dados. 
  ∙ Los (1) suman 100 puntos, y los (5) suman 50.
  ∙ Luego de cada tirada, el jugador decide si plantarse o seguir tirando.
  ∙ Si el jugador sigue tirando, lanza los dados que no sumaron puntos en la 
  tirada anterior.
  ∙ Si en una tirada el jugador no suma puntos, pierde todo lo acumulado en ese
  turno.\n", pausa = 0.005)
  texto_lento(" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EVENTOS ESPECIALES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n
  ∙ Si en una tirada todos los dados suman puntos, el jugador puede volver a 
  tirar con cinco dados.
  ∙ Si en una tirada el jugador supera el puntaje máximo, pierde todo lo 
  acumulado en ese turno.
  ∙ Si ambos jugadores alcanzan el puntaje máximo en la misma ronda, se 
  considera empate.\n ", pausa = 0.005)
  
  # Pausa para leer
  pausa(mensaje = "")
  
  # Limpiar consola
  limpiar_consola()
  
  # Pedir nombres
  texto_lento("Antes de comenzar, ingrese los nombres de los jugadores.\n")
  texto_lento("Jugador 1: ")
  nombre1 <- leer_palabra()
  texto_lento("Jugador 2: ")
  nombre2 <- leer_palabra()
  
  # Mensaje de confirmación con los nombres
  texto_lento("\n¡Perfecto! Va a jugar «", nombre1, "» contra «", nombre2, "»\n")
  
  # Pausa antes de avanzar
  pausa(mensaje = "¿Están listos?\n")
  
  # Devolver vector
  return(c(nombre1, nombre2))
}


#' Mostrar los puntajes actuales de la partida.
#'
#' Imprime en pantalla los nombres y puntajes usando una flecha para separar.
#'
#' @param nombre1 Nombre del primer jugador
#' @param nombre2 Nombre del segundo jugador
#' @param puntaje1 Puntaje actual del primer jugador
#' @param puntaje2 Puntaje actual del segundo jugador
#'
#' @return No devuelve ningún valor. Solo imprime la información en la consola.
#'
#' @examples
#' mostrar_puntaje("Nico", "Ramiro", 150, 320)
mostrar_puntaje <- function(nombre1, nombre2, puntaje1, puntaje2) {
  cat("INFORMACIÓN DE LA PARTIDA\n\n")
  cat(nombre1, "→", puntaje1, "puntos\n")
  cat(nombre2, "→", puntaje2, "puntos\n")
  cat("\n")
  cat("######################################################################")
  cat("\n\n")
}


#' Mostrar la información del turno actual
#'
#' Imprime una tabla con el número de tirada, puntos acumulados en el turno
#' y dados disponibles para la próxima tirada.
#'
#' @param tirada Número de la tirada actual
#' @param acumulado Puntos acumulados en el turno hasta el momento
#' @param disponibles Cantidad de dados que se pueden volver a tirar.
#'
#' @return No devuelve ningún valor. Solo imprime la tabla en la consola.
#'
#' @examples
#' mostrar_turno(1, 150, 3)
mostrar_turno <- function(tirada, acumulado, disponibles) {
  cat("INFORMACIÓN DEL TURNO\n\n")
  cat("Tiradas   Acumulado   Dados disponibles\n")
  cat("-------   ---------   -----------------\n")
  cat(tirada, "          ", acumulado, "             ", disponibles, "\n", sep = "")
}

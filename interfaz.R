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
# FUNCIONES: pantalla_inicio, mostrar_puntaje, mostrar_turno
#-------------------------------------------------------------------------------

#' Muestra la pantalla de inicio y lee los nombres de los jugadores
#'
#' @return Vector de caracteres con los dos nombres ingresados.
pantalla_inicio <- function() {
  # Limpiar consola
  limpiar_consola()
  
  # Mostrar título
  cat("  _____  _    ___ _  __ _    ___ \n")
  cat(" | __  |/ \\  | _ \\ |/ /| |  | __|\n")
  cat(" | _/ / _  \\ |   /   < | |__| _| \n")
  cat(" |_| /_/ \\__\\|_|_\\_|\\_\\|____|___|\n")
  cat("\n")
  cat(" ================================\n")
  cat("       EL JUEGO DE DADOS\n")
  cat(" ================================\n")
  cat("\n")
  
  # Mensaje de bienvenida y reglas del juego
  texto_lento(" /// BIENVENIDOS! ////////////////////////////////////////////////////////// \n
  > Farkle es un juego de dados de estrategia y gestión de riesgo en el que dos
  jugadores compiten por alcanzar el puntaje máximo de 1000 puntos antes que
  su rival.
  > La partida se desarrolla a lo largo de múltiples rondas. En cada una de
  estas rondas, los jugadores participan por turnos respetando un orden. Dentro
  de su turno, cada jugador puede lanzar los dados una o más veces, dependiendo
  del resultado de cada tirada. \n" , pausa = 0.003)
  texto_lento(" /// REGLAS /////////////////////////////////////////////////////////////// \n
  * Cada jugador comienza lanzando cinco dados.
  * Los (1) suman 100 puntos, y los (5) suman 50.
  * Luego de cada tirada, el jugador decide si plantarse o seguir tirando.
  * Si el jugador sigue tirando, lanza los dados que no sumaron puntos en la
  tirada anterior.
  * Si en una tirada el jugador no suma puntos, pierde todo lo acumulado en ese
  turno.\n", pausa = 0.003)
  texto_lento(" /// EVENTOS ESPECIALES ////////////////////////////////////////////////// \n
  * Si en una tirada todos los dados suman puntos, el jugador puede volver a
  tirar con cinco dados.
  * Si en una tirada el jugador supera el puntaje máximo, pierde todo lo
  acumulado en ese turno.
  * Si ambos jugadores alcanzan el puntaje máximo en la misma ronda, se
  considera empate.\n ", pausa = 0.003)
  
  # Pausa para leer
  pausa(mensaje = "")
  
  # Limpiar consola
  limpiar_consola()
  
  # Pedir nombres
  texto_lento("Antes de comenzar, ingrese los nombres de los jugadores.\n", pausa = 0.003)
  texto_lento("Jugador 1: ", pausa = 0.003)
  nombre1 <- leer_palabra()
  cat("\n")
  texto_lento("Jugador 2: ", pausa = 0.003)
  nombre2 <- leer_palabra()
  
  # Mensaje de confirmación con los nombres
  texto_lento("\n¡Perfecto! Va a jugar", nombre1, "contra", nombre2, "\n", pausa = 0.003)
  
  # Pausa antes de avanzar
  pausa(mensaje = "¿Están listos?\n")
  
  # Devolver vector
  return(c(nombre1, nombre2))
}


#' Muestra una tabla con los puntajes de ambos jugadores
#'
#' Imprime una tabla con los nombres de los jugadores y sus puntajes
#' (alineados a la derecha).
#' El ancho de la columna de nombres se ajusta
#' automáticamente al nombre más largo (dejando un mínimo de 8 caracteres para
#' nombres cortos), evitando desalineamientos.
#'
#' @param nombre1 Nombre del primer jugador
#' @param nombre2 Nombre del segundo jugador
#' @param puntaje1 Puntaje actual del primer jugador
#' @param puntaje2 Puntaje actual del segundo jugador
#'
#' @return No devuelve ningún valor. Solo imprime la tabla en la consola.
#'
#' @examples
#' mostrar_puntaje("Nicolas", "Ramiro", 250, 0)
mostrar_puntaje <- function(nombre1, nombre2, puntaje1, puntaje2) {
  
  # Buscamos el nombre más largo, con un mínimo de 8 caracteres.
  ancho <- max(nchar(nombre1), nchar(nombre2), 8)
  
  # Imprimimos la tabla teniendo en cuenta el tamaño del nombre.
  cat("INFORMACIÓN DE LA PARTIDA\n\n")
  cat(format("Jugador", width = ancho), format("Puntos", width = 6, justify = "right"), "\n")
  cat(format("-------", width = ancho), format("------", width = 6, justify = "right"), "\n")
  cat(format(nombre1, width = ancho), format(puntaje1, width = 6, justify = "right"), "\n")
  cat(format(nombre2, width = ancho), format(puntaje2, width = 6, justify = "right"), "\n")
  cat("\n\n")
}


#' Mostrar la información del turno actual
#'
#' Imprime una tabla con el número de tirada, puntos acumulados en el turno
#' y dados disponibles para la próxima tirada.
#'
#' @param cant_tiradas Número de tiradas realizadas hasta el momento
#' @param acumulado Puntos acumulados en el turno hasta el momento
#' @param disponibles Cantidad de dados que se pueden volver a tirar.
#'
#' @return No devuelve ningún valor. Solo imprime la tabla en la consola.
#'
#' @examples
#' mostrar_turno(1, 150, 3)
mostrar_turno <- function(cant_tiradas, acumulado, disponibles) {
  cat("INFORMACIÓN DEL TURNO\n\n")
  cat("Tiradas   Acumulado   Dados disponibles\n")
  cat("-------   ---------   -----------------\n")
  # usamos format(width=) que encontramos buscando en la documentación de R
  # para forzar el ancho de columna y que la tabla no se desalinee
  cat(format(cant_tiradas, width = 7), "   ",
      format(acumulado,    width = 9), "   ",
      format(disponibles,  width = 17), "\n", sep = "")
}

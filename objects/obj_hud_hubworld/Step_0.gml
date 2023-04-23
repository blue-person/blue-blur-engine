// Ajustar transparencia segun las acciones del jugador
if (obj_jugador.tocando_suelo) and (abs(obj_jugador.velocidad_horizontal) == 0) and (obj_jugador.accion == 0) {
    transparencia = 1;
} else {
    transparencia = 0.5;
}
// Dibujar colisiones del jugador
if (instance_exists(obj_jugador)) {
	if (permitir_depuracion) {
		colision_con_suelo(obj_jugador);
		colision_con_riel(obj_jugador);
		colision_lineal_derecha(obj_jugador);
		colision_lineal_izquierda(obj_jugador);
		colision_circular_principal(obj_jugador);
		colision_circular_izquierda(obj_jugador);
		colision_circular_derecha(obj_jugador);
		colision_circular_superior(obj_jugador);
		colision_circular_inferior(obj_jugador);
	}
}
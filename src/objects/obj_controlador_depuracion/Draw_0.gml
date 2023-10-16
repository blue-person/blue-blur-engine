// Dibujar colisiones del jugador
if (permitir_ver_colisiones) {
	if (jugador_existe) {
		with (jugador) {
			colision_con_suelo();
			colision_con_riel();
			colision_lineal_derecha();
			colision_lineal_izquierda();
			colision_circular_central();
			colision_circular_izquierda();
			colision_circular_derecha();
			colision_circular_superior();
			colision_circular_inferior();
		}
	}
}
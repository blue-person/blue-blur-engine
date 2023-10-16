if (jugador_existe) {
	// Variables
	var colision_con_jugador = place_meeting(x, y, jugador);
	var jugador_esta_cerca = collision_line(x, y, pos_x_2, pos_y_2, jugador, true, true);
	
	// Gestionar comportamiento
	if (activar_evento and jugador_esta_cerca) {
		activar_evento = false;
	
	    with (jugador) {
	        if ((accion != 35) and (accion != 26)) {
				// Reproducir efectos de sonido
				audio.reproducir_audio_aislado(snd_rodar, true);
				
				// Modificar parametros del jugador
				x = other.pos_x_2;
				y = other.pos_y_2;
	            accion = 35;
	        }
	    }
	}
	
	// Gestionar bandera
	if (not colision_con_jugador) {
		activar_evento = true;
	}
}
if (jugador_existe) {
	// Variables
	var pos_x_1 = x + dcos(image_angle);
	var pos_y_1 = y - dsin(image_angle);
	var pos_x_2 = x - dcos(image_angle) * 70;
	var pos_y_2 = y + dsin(image_angle) * 70;
	var colision_con_jugador = place_meeting(x, y, jugador);
	var jugador_esta_cerca = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, jugador, true, true);
	
	// Gestionar comportamiento
	if (activar_evento and jugador_esta_cerca) {
		activar_evento = false;
	
	    with (jugador) {
	        if ((accion != 35) and (accion != 26)) {
	            accion = 35;
				audio.reproducir_audio_aislado(snd_rodar, true);
	        }
	    }
	}
	
	// Gestionar bandera
	if (not colision_con_jugador) {
		activar_evento = true;
	}
}
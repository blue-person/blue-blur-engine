if (activar_evento and (other.accion != 26)) {
	// Variables
	var direccion_disparo = sign(image_xscale);
	
	// Ajustar variables del objeto
	activar_evento = false;
	
	// Ajustar variables del jugador
	with (jugador) {
		image_index = 0;
		x = other.x;
		y = other.y - 20;
		accion = 7;
		tocando_suelo = false;
		permitir_uso_boost = false;
		direccion_horizontal = direccion_disparo;
		velocidad_horizontal = direccion_disparo * other.fuerza_horizontal;
		velocidad_vertical = other.fuerza_vertical;	
	}
	
	// Gestionar efectos
	audio.reproducir_audio_aislado(snd_dashramp, false);
	controles.inhabilitar_lectura(2);
	
	// Dibujar efectos visuales
	if (direccion_disparo == 1) {
		dibujar_efectos(spr_efecto_velocidad, 30, 1, 1, true);
	} else {
		dibujar_efectos(spr_efecto_velocidad, -30, -1, 1, true);
	}
}
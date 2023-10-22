if (activar_evento and (other.accion != 26)) {
	// Variables
	var direccion_disparo = sign(image_xscale);
	
	// Ajustar variables del objeto
    activar_evento = false;
	
	// Establecer efectos
    dibujar_efectos(spr_efecto_velocidad, image_angle, direccion_disparo, 1, false);
	audio.reproducir_audio_aislado(snd_dashpad, false);
	
	// Ajustar variables del jugador
	with (jugador) {
		// Iniciar alarma
		iniciar_alarma(1, 30);
		
		// Establecer parametros
		accion = 8;
		tocando_suelo = true;
		direccion_horizontal = direccion_disparo;
		velocidad_horizontal = direccion_disparo * limite_velocidad_maxima;
	}
}
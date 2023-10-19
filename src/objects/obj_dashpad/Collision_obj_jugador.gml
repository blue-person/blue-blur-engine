if (activar_evento and (other.accion != 26)) {
	// Variables
	var direccion_disparo = sign(image_xscale);
	
	// Ajustar parametros del objeto
    activar_evento = false;
	
	// Establecer efectos
    dibujar_efectos(spr_efecto_velocidad, image_angle, direccion_disparo, 1, false);
	audio.reproducir_audio_aislado(snd_dashpad, false);
	
	// Ajustar parametros del jugador
	with (jugador) {
		accion = 8;
		alarma_1 = 20;
		tocando_suelo = true;
		direccion_horizontal = direccion_disparo;
		velocidad_horizontal = direccion_disparo * limite_velocidad_maxima;
	}
}
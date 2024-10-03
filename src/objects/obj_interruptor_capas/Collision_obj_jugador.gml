if (activar_evento) {
	// Reproducir sonido
	audio.reproducir_audio(snd_usar_interruptor_riel);
	
	// Ajustar parametros
    image_index = 7;
    image_speed = 2;
	
	// Ajustar variables
	fue_activado = true;
	activar_evento = false;
	
	// Cambiar capa
	if (sprite_index == spr_interruptor_capas_azul) {
		sprite_index = spr_interruptor_capas_rojo;
		other.capa_actual = "posterior";
	} else {
		sprite_index = spr_interruptor_capas_azul;
		other.capa_actual = "frontal";
	}
}
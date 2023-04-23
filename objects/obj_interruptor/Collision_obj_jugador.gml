if (!activar_evento) {
    activar_evento = true;
    image_speed = 0.25;
	
    audio_play_sound(snd_activar_interruptor, 1, false);
	
    if (compuerta == obj_compuerta) {
		audio_play_sound(snd_abrir_compuerta, 1, false);
		
		var compuerta_cercana = instance_nearest(x, y, compuerta);
		compuerta_cercana.activar_evento = true;
	}
}

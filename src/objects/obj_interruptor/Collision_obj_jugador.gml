if (not activar_evento) {
	// Ajustar parametros y efectos
	audio.reproducir_audio(snd_activar_interruptor);
	image_speed = 0.25;
	activar_evento = true;
	
	// Activar el dispositivo conectado
	if (dispositivo_conectado != noone) {
		dispositivo_conectado.activar_evento = true;
	}
}

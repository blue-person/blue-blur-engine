if (jugador.accion == 21) {
	// Reproducir sonido
	audio.reproducir_audio(snd_fourwaycannon_timeout);
			
	// Ajustar variables
	activar_evento = false;
	jugador.accion = 0;
}
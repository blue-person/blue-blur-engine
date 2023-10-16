if (jugador_existe) {
	// Reproducir efectos de sonido
	audio.reproducir_audio(snd_fourwaycannon_disparo);

	// Modificar parametros del jugador
	jugador.accion = 36;
	jugador.direccion_horizontal = 1;
	jugador.velocidad_horizontal = cantidad_fuerza;
}
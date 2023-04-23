function reproducir_cancion(archivo_cancion) {
	if (!audio_is_playing(archivo_cancion)) {
		return audio_play_sound(archivo_cancion, 0, false);
	} else {
		return archivo_cancion;
	}
}
function detener_efecto_sonido(efecto_sonido) {
	if (audio_is_playing(efecto_sonido)) then audio_stop_sound(efecto_sonido);
}

function reproducir_efecto_sonido(efecto_sonido, prioridad = 1, reproducir_en_bucle = false) {
	detener_efecto_sonido(efecto_sonido);
	audio_play_sound(efecto_sonido, prioridad, reproducir_en_bucle);
}
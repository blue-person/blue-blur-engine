if (activar_evento and (other.accion != 26)) {
    if (other.accion != 29) {
		audio_play_sound(snd_agarrar_objeto, 1, false);
	}
	
    activar_evento = false;
    other.accion = 29;
}
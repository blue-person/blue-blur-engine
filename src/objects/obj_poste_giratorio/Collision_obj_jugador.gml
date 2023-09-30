if (activar_evento and (other.accion != 26)) {
    if (other.accion != 29) {
		audio.reproducir_audio(snd_agarrar_objeto);
	}
	
    activar_evento = false;
    other.accion = 29;
}
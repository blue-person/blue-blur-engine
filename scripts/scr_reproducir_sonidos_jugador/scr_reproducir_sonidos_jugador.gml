function reproducir_sonido_triunfar_qte() {
	var sonido_qte = obj_jugador.audio_festejo;
	audio.reproducir_audio(sonido_qte);
}

function reproducir_sonido_muerte(){
	var sonido_muerte = obj_jugador.audio_muerte;
	audio.reproducir_audio(sonido_muerte);
}
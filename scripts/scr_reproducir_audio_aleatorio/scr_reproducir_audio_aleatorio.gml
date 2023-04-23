function reproducir_audio_aleatorio(lista_audios) {
	randomize();
	var longitud_lista = array_length(lista_audios);
	var indice = irandom(longitud_lista - 1);
	audio_play_sound(lista_audios[indice], 1, false);
}
// Metodos
reproducir_audio = function(nombre_audio, prioridad_reproduccion = PRIORIDAD_SONIDOS, reproducir_en_bucle = false, volumen = 1, tonalidad = 1) {
	// Reproducir audio
	return audio_play_sound(nombre_audio, prioridad_reproduccion, reproducir_en_bucle, volumen, 0, tonalidad);
}

reproducir_audio_aislado = function(nombre_audio, permitir_completar_audio, prioridad_reproduccion = PRIORIDAD_SONIDOS, reproducir_en_bucle = false, volumen = 1, tonalidad = 1) {
	if (permitir_completar_audio) {
		// Permitir que el audio acabe antes de reproducirlo nuevamente
		if (not audio_is_playing(nombre_audio)) {
			return self.reproducir_audio(nombre_audio, prioridad_reproduccion, reproducir_en_bucle, volumen, tonalidad);
		} else {
			return noone;
		}
	} else {
		// Detener el audio antes de reproducirlo nuevamente
		self.detener_audio(nombre_audio);
		return self.reproducir_audio(nombre_audio, prioridad_reproduccion, reproducir_en_bucle, volumen, tonalidad);
	}
}

reproducir_audio_aleatorio = function(lista_audios, permitir_completar_audio = noone, prioridad_reproduccion = PRIORIDAD_SONIDOS, reproducir_en_bucle = false, volumen = 1, tonalidad = 1) {
	// Obtener un nuevo valor para la aleatoriedad
	randomize();
	
	// Escoger de forma aleatoria un audio
	var longitud_lista = array_length(lista_audios);
	var indice = irandom(longitud_lista - 1);
	var audio_seleccionado = lista_audios[indice];
	
	// Reproducir el audio
	if (permitir_completar_audio == noone) {
		return self.reproducir_audio(audio_seleccionado, prioridad_reproduccion, reproducir_en_bucle, volumen, tonalidad);
	} else {
		return self.reproducir_audio_aislado(audio_seleccionado, permitir_completar_audio, prioridad_reproduccion, reproducir_en_bucle, volumen, tonalidad);
	}
}

detener_audio = function(nombre_audio) {
	// Detener el audio en caso de que este sonando
	if (audio_is_playing(nombre_audio)) {
		return audio_stop_sound(nombre_audio);
	}
	return noone;
}

detener_todo = function() {
	// Detener todos los sonidos
	return audio_stop_all();
}

pausar_todo = function() {
	// Pausar todos los sonidos
	return audio_pause_all();
}

reproducir_cancion = function(nombre_audio) {
	// Reproducir cancion
	return self.reproducir_audio_aislado(nombre_audio, true, PRIORIDAD_CANCIONES);
}

reproducir_cancion_bucle = function(nombre_audio, inicio_bucle = 0, final_bucle = noone) {
	// Gestionar parametros vacios 
	if ((inicio_bucle == 0) and (final_bucle == noone)) {
		return self.reproducir_audio_aislado(nombre_audio, true, PRIORIDAD_CANCIONES, true);
	} else if (final_bucle == noone) {
		final_bucle = audio_sound_length(nombre_audio);
	}
	
	// Declarar variables
	var cancion = self.reproducir_audio_aislado(nombre_audio, true, PRIORIDAD_CANCIONES, true);
	
	// Establecer puntos de inicio y del final del bucle
	audio_sound_loop_start(nombre_audio, inicio_bucle);
	audio_sound_loop_end(nombre_audio, final_bucle);
	
	// Reproducir cancion en bucle
	return audio_sound_loop(cancion, true);
}

detener_cancion = function(nombre_audio) {
	// Detener la cancion
	return self.detener_audio(nombre_audio);
}
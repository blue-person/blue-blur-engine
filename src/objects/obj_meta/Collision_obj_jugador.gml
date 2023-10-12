// Ajustar objetos
hud.ocultar();
cronometro.detener_cronometro();
camara.establecer_enfoque(self);
other.zona_superada = true;

// Efecto de sonido
audio.reproducir_audio_aislado(snd_tocar_meta, true);

// Eliminar controlador de pausa
if (instance_exists(obj_controlador_pausa)) {
	instance_destroy(obj_controlador_pausa);
}

// Preparar el final del nivel
if (fase_evento == 1) {
	// Ajustar efectos
    alarm[1] = 180;
    audio.reproducir_audio(snd_animacion_meta);
	
	// Calcular puntajes
    nivel.calcular_puntaje_rings();
	nivel.calcular_puntaje_tiempo();
}

// Ajustar variables
fase_evento = 2;
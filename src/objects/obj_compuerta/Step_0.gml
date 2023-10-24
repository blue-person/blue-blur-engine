if (activar_evento) {
    // Modificar la ubicacion de la compuerta
	vspeed = -velocidad_apertura;
	
	// Gestionar variables
	if (y == ubicacion_inicial) {
		audio.reproducir_audio(snd_abrir_compuerta);
	} else if (y <= ubicacion_final) {
		activar_evento = false;
	}
}
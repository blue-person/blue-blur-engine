if (not activar_evento and other.tocando_suelo) {
	// Modificar bandera
    activar_evento = true;

	// Iniciar alarma
	iniciar_alarma(0, tiempo_temblando);
	
	// Reproducir audio
    audio.reproducir_audio(snd_plataforma_temblando);
}
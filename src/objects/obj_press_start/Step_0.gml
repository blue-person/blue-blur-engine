if (controles.boton_presionado("boton_entrada")) {
	// Aumentar la velocidad del efecto
	velocidad_efecto = 0.1;
	
	// Continuar al juego
	if (permitir_transicion) {
		permitir_transicion = false;
		audio.detener_todo();
		audio.reproducir_audio(snd_confirmar_opcion);
		transiciones.iniciar_efecto_intraniveles("morado", 0.01, rm_hub_world);
	}
} else {
	// Gestionar la transparencia del mensaje
	if (estado_animacion == 0) {
		if (transparencia >= 1) {
			estado_animacion = 1;
		} else {
			transparencia += velocidad_efecto;
		}
	} else {
		if (transparencia <= 0) {
			estado_animacion = 0;
		} else {
			transparencia -= velocidad_efecto;
		}
	}
}
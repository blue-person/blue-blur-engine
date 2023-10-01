if (estado_animacion == 0) {
	transparencia += valor_aumento_transparencia;
	
	if (transparencia >= 1) {
		estado_animacion = 1;
	}
} else {
	transparencia -= valor_aumento_transparencia;
	
	if (transparencia <= 0) {
		estado_animacion = 0;
	}
}

if (controles.boton_presionado("boton_entrada")) {
	valor_aumento_transparencia = 0.1;
	
	if (permitir_transicion) {
		permitir_transicion = false;
	
		audio.detener_todo();
		audio.reproducir_audio(snd_confirmar_opcion);
		transiciones.iniciar_efecto_intraniveles("morado", 0.01, rm_hub_world);
	}
}
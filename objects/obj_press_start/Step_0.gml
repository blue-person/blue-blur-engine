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

if (obj_controles.boton_entrada.estado_pulsado) {
	valor_aumento_transparencia = 0.1;
	
	if (permitir_transicion) {
		permitir_transicion = false;
	
		audio_stop_all();
		audio_play_sound(snd_confirmar_opcion, 1, false);
		iniciar_transicion_niveles(rm_hub_world, "negro", 0.01);
	}
}
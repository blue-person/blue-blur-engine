if (verificar_boton_mantenido("boton_especial")) {
	if ((obj_jugador.tocando_suelo) and (abs(obj_jugador.velocidad_horizontal) == 0) and (obj_jugador.accion == 0)) {
		//obj_controles.permitir_uso_controles = false;
		iniciar_transicion_simple("negro", 0.05);
		
		if (alarm[0] == -1) {
			alarm[0] = 15;
		}
	}
}
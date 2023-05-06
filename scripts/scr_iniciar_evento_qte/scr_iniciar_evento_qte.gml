function determinar_botones_qte() {
	if (input_source_using(INPUT_GAMEPAD)) {
		return ["boton_salto", "boton_boost", "boton_ataque", "boton_especial"];
	} else {
		return ["boton_izquierda", "boton_abajo", "boton_arriba", "boton_derecha"];
	}
}

function iniciar_evento_qte(tiempo_reaccion = 60) {
	obj_jugador.usando_boost = false;
	obj_jugador.tocando_suelo = false;
	obj_jugador.indice_sprite = 0;
	obj_jugador.x = self.x;
	obj_jugador.y = self.y - 20;
	obj_jugador.direccion_horizontal = self.image_xscale;
	obj_jugador.accion = 14;
	obj_jugador.velocidad_horizontal = 8 * obj_jugador.direccion_horizontal;
	obj_jugador.velocidad_vertical = -7;
	
	//obj_controles.permitir_uso_controles = false;
	activar_evento = false;
	reproducir_efecto_sonido(snd_dashramp, 1, false);
	alarm[0] = tiempo_reaccion;
}
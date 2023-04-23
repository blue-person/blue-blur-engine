function determinar_botones_qte() {
	var tipo_controles = determinar_tipo_controles();
	if (tipo_controles == "teclado") {
		return [obj_controles.boton_izquierda, obj_controles.boton_abajo, obj_controles.boton_arriba, obj_controles.boton_derecha];
	} else {
		return [obj_controles.boton_salto, obj_controles.boton_boost, obj_controles.boton_ataque, obj_controles.boton_especial];
	}
}

function iniciar_evento_qte() {
	obj_jugador.usando_boost = false;
	obj_jugador.tocando_suelo = false;
	obj_jugador.indice_sprite = 0;
	obj_jugador.x = self.x;
	obj_jugador.y = self.y - 20;
	obj_jugador.direccion_horizontal = self.image_xscale;
	obj_jugador.accion = 14;
	obj_jugador.velocidad_horizontal = 8 * obj_jugador.direccion_horizontal;
	obj_jugador.velocidad_vertical = -7;
	
	obj_controles.permitir_uso_controles = false;
	activar_evento = false;
	reproducir_efecto_sonido(snd_dashramp, 1, false);
	alarm[0] = 60;
}
function determinar_botones_qte() {
	if (control.obtener_tipo_controles() == "teclado") {
		return ["boton_izquierda", "boton_abajo", "boton_arriba", "boton_derecha"];
	} else {
		return ["boton_salto", "boton_boost", "boton_ataque", "boton_especial"];
	}
}

function iniciar_evento_qte(tiempo_reaccion = 60) {
	obj_jugador.usando_boost = false;
	obj_jugador.tocando_suelo = false;
	obj_jugador.image_index = 0;
	obj_jugador.x = self.x;
	obj_jugador.y = self.y - 20;
	obj_jugador.direccion_horizontal = self.image_xscale;
	obj_jugador.accion = 14;
	obj_jugador.velocidad_horizontal = 8 * obj_jugador.direccion_horizontal;
	obj_jugador.velocidad_vertical = -7;
	
	audio.reproducir_audio_aislado(snd_dashramp, false);

	control.inhabilitar_lectura(2);
	activar_evento = false;
	alarm[0] = tiempo_reaccion;
}
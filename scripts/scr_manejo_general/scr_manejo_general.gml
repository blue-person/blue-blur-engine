function preparar_ubicacion_jugador() {
	nivel.eliminar_puntaje();
	
	if (nivel.obtener_permiso_reaparicion()) {
		var ubicacion_reaparicion = nivel.obtener_ubicacion_reaparicion();
		obj_jugador.x = ubicacion_reaparicion.pos_x;
		obj_jugador.y = ubicacion_reaparicion.pos_y;
	}
}

function aumentar_vidas() {
	audio.reproducir_audio_aislado(snd_vida_extra, false);
	global.vidas_restantes++;
}

function herir_jugador() {
	obj_jugador.indice_sprite = 0;
	obj_jugador.tocando_suelo = false;
	obj_jugador.velocidad_vertical = -4;
	obj_jugador.velocidad_horizontal = -5 * obj_jugador.direccion_horizontal;
	obj_jugador.permitir_ser_apuntado = false;
	
	if (obj_jugador.rings > 0) {
	    obj_jugador.accion = 22;
	    obj_jugador.tiempo_invencibilidad = 240;
		
	    disperar_rings();
		switch (global.personaje_actual) {
			case "Sonic":
				audio.reproducir_audio(snd_quejido_sonic);
				break;
			case "Shadow":
				audio.reproducir_audio(snd_quejido_shadow);
				break;
		}
	} else {
	    obj_jugador.accion = 26;
	    obj_jugador.alarma_3 = 120;
		
	    if (instance_exists(obj_hud_normal)) then obj_hud_normal.mostrar_en_pantalla = false;
	    if (instance_exists(obj_controlador_pausa)) then instance_destroy(obj_controlador_pausa);
		
		reproducir_sonido_muerte();
	}
}

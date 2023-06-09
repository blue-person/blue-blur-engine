function preparar_ubicacion_jugador() {
	if (reaparicion.obtener_permiso_reaparicion()) {
		obj_jugador.x = reaparicion.obtener_pos_x();
		obj_jugador.y = reaparicion.obtener_pos_y();
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
	    if (instance_exists(obj_menu_pausa)) then instance_destroy(obj_menu_pausa);
		
		reproducir_sonido_muerte();
	}
}

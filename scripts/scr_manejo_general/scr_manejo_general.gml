function preparar_ubicacion_jugador() {
	if (instance_exists(obj_controlador_checkpoint)) {
	    if (obj_controlador_checkpoint.checkpoint) {
	        obj_jugador.x = obj_controlador_checkpoint.pos_x;
	        obj_jugador.y = obj_controlador_checkpoint.pos_y;
	    }
	}
}

function aumentar_vidas() {
	reproducir_efecto_sonido(snd_vida_extra, 1, false);
	++global.vidas_restantes;
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
				audio_play_sound(snd_quejido_sonic, 1, false);
				break;
			case "Shadow":
				audio_play_sound(snd_quejido_shadow, 1, false);
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

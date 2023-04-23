other.zona_superada = true;
obj_hud_normal.mostrar_en_pantalla = false;
obj_controlador_tiempo.medir_tiempo = false;
obj_camara.objeto_enfocado = self;

// Efecto de sonido
if (!audio_is_playing(snd_tocar_meta)) then audio_play_sound(snd_tocar_meta, 1, false);

if (instance_exists(obj_menu_pausa)) then instance_destroy(obj_menu_pausa);

if (!activar_evento) {
    audio_play_sound(snd_animacion_meta, 1, false);
    alarm[0] = 180;
	
	// Puntaje de los rings
    global.puntaje_rings = other.rings * 100;
	
	// Puntaje del tiempo
	switch (obj_controlador_tiempo.minutos) {
	    case 0:
			if (obj_controlador_tiempo.segundos <= 30) {
				global.puntaje_tiempo = 50000;
			} else {
	            global.puntaje_tiempo = 10000;
			}
	        break;
		case 1:
	        global.puntaje_tiempo = 5000;
	        break;
		case 2:
	        if (obj_controlador_tiempo.segundos <= 30) {
				global.puntaje_tiempo = 2500;
			} else {
				global.puntaje_tiempo = 1250;
			}
	        break;
	    default:
	        global.puntaje_tiempo = 1000;
	        break;
	}
}

activar_evento = 1;
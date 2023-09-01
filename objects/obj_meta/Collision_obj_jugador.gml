other.zona_superada = true;
obj_hud_normal.mostrar_en_pantalla = false;
obj_cronometro.detener_cronometro();
obj_camara.establecer_enfoque(self);

// Efecto de sonido
audio.reproducir_audio_aislado(snd_tocar_meta, true);

if (instance_exists(obj_menu_pausa)) then instance_destroy(obj_menu_pausa);

if (not activar_evento) {
    audio.reproducir_audio(snd_animacion_meta);
    alarm[0] = 180;
	
	// Puntaje de los rings
    nivel.establecer_puntaje_rings(other.rings * 100);
	
	// Puntaje del tiempo
	var tiempo = obj_cronometro.obtener_tiempo("numerico");
	switch (tiempo[0]) {
	    case 0:
			if (tiempo[1] <= 30) {
				nivel.establecer_puntaje_tiempo(50000);
			} else {
	            nivel.establecer_puntaje_tiempo(10000);
			}
	        break;
		case 1:
	        nivel.establecer_puntaje_tiempo(5000);
	        break;
		case 2:
	        if (tiempo[1] <= 30) {
				nivel.establecer_puntaje_tiempo(2500);
			} else {
				nivel.establecer_puntaje_tiempo(1250);
			}
	        break;
	    default:
	        nivel.establecer_puntaje_tiempo(1000);
	        break;
	}
}

activar_evento = true;
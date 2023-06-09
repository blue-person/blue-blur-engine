if (transparencia_barra < 1) then transparencia_barra += 0.05;

switch (fase_animacion) {
    case 1:
		pos_x_titulo += 12;
			
		if (pos_x_titulo >= 125) {
			pos_x_titulo = 125;
			fase_animacion = 2;
			alarm[0] = 120;
		}
        break;
	case 3:
		pos_y_titulo -= 3
		
	    if (pos_y_titulo <= 32) {
	        fase_animacion = 4;
	    }
        break;
    case 4:
        pos_x_texto_tiempo += 12;
	    pos_x_puntaje_tiempo -= 12;
		
	    if (pos_x_texto_tiempo >= pos_final_texto) {
			fase_animacion = 5;
		}
        break;
    case 5:
	    pos_x_texto_rings += 12;
	    pos_x_puntaje_rings -= 12;
		
	    if (pos_x_texto_rings >= pos_final_texto) {
			fase_animacion = 6;
		}
        break;
    case 6:
        pos_x_texto_cool += 12;
	    pos_x_puntaje_cool -= 12;
		
	    if (pos_x_texto_cool >= pos_final_texto) {
			fase_animacion = 7;
		}
        break;
    case 7:
        pos_x_puntaje_final += 12;
		
	    if (pos_x_puntaje_final >= pos_final_texto) {
			fase_animacion = 8;
			alarm[2] = 60;
	    }
        break;
    case 9:
		if (control.boton_presionado("boton_salto") or control.boton_presionado("boton_entrada")) {
			global.puntaje_final += global.puntaje_rings + global.puntaje_tiempo + global.puntaje_cool;
			
			global.puntaje_rings = 0;
			global.puntaje_tiempo = 0;
		    global.puntaje_cool = 0;
		} else {
			global.puntaje_rings = registrar_puntaje(global.puntaje_rings);
			global.puntaje_tiempo = registrar_puntaje(global.puntaje_tiempo);
		    global.puntaje_cool = registrar_puntaje(global.puntaje_cool);
		}

	    audio.reproducir_audio_aislado(snd_agregar_puntos, true);
    
	    if ((global.puntaje_rings == 0) and (global.puntaje_tiempo == 0) and (global.puntaje_cool == 0)) {
	        audio.reproducir_audio(snd_registrar_puntaje);
			fase_animacion = 10;
	        alarm[3] = 180;
	    }
        break;
    case 11:
	    if (estado_boton_continuar == 0) {
	        transparencia_boton_continuar += 0.05;
		
	        if (transparencia_boton_continuar >= 1) {
				estado_boton_continuar = 1;
			}
	    } else {
	       transparencia_boton_continuar -= 0.05;
	   
	       if (transparencia_boton_continuar <= 0) {
			   estado_boton_continuar = 0;
		   }
	    }

	    if (permitir_transicion and control.boton_presionado("boton_salto")) {
			permitir_transicion = false;
			
	        audio.detener_todo();
	        audio.reproducir_audio(snd_confirmar_opcion);
			iniciar_transicion_niveles(rm_hub_world, "negro", 0.015);
	    }
        break;
}

	
if (fase_animacion >= 4) {
    if (pos_y_barra_superior < 0) {
		pos_y_barra_superior += 2;
	} else {
        pos_y_barra_superior = 0;
	}
    
    if (pos_y_barra_inferior > 256) {
		pos_y_barra_inferior -= 2;
	} else {
        pos_y_barra_inferior = 256;
	}
}
if (parametros_bandas.transparencia < 1) {
	parametros_bandas.transparencia += 0.05;
}

switch (fase_animacion) {
    case 1:
		parametros_titulo.pos_x += 12;
			
		if (parametros_titulo.pos_x >= parametros_titulo.pos_x_final) {
			parametros_titulo.pos_x = 125;
			fase_animacion = 2;
			alarm[0] = 120;
		}
        break;
	case 3:
		parametros_titulo.pos_y -= 3
		
	    if (parametros_titulo.pos_y <= parametros_titulo.pos_x_final) {
	        fase_animacion = 4;
	    }
        break;
    case 4:
        parametros_tiempo.pos_x_titulo += 12;
	    parametros_tiempo.pos_x_contenido -= 12;
		
	    if (parametros_tiempo.pos_x_titulo >= parametros_tiempo.pos_x_final) {
			fase_animacion = 5;
		}
        break;
    case 5:
	    parametros_rings.pos_x_titulo += 12;
	    parametros_rings.pos_x_contenido -= 12;
		
	    if (parametros_rings.pos_x_titulo >= parametros_rings.pos_x_final) {
			fase_animacion = 6;
		}
        break;
    case 6:
        parametros_cool.pos_x_titulo += 12;
	    parametros_cool.pos_x_contenido -= 12;
		
	    if (parametros_cool.pos_x_titulo >= parametros_cool.pos_x_final) {
			fase_animacion = 7;
		}
        break;
    case 7:
        parametros_total.pos_x_contenido += 12;
		
	    if (parametros_total.pos_x_contenido >= parametros_total.pos_x_final) {
			fase_animacion = 8;
			alarm[2] = 60;
	    }
        break;
    case 9:
		if (controles.boton_presionado("boton_salto") or controles.boton_presionado("boton_entrada")) {
			nivel.calcular_puntaje_final("automatico");
		} else {
			nivel.calcular_puntaje_final("incremental");
		}

	    audio.reproducir_audio_aislado(snd_agregar_puntos, true);
    
	    if (nivel.comprobar_puntaje_vacio()) {
	        audio.reproducir_audio(snd_registrar_puntaje);
			fase_animacion = 10;
	        alarm[3] = 180;
	    }
        break;
    case 11:
	    if (parametros_boton.estado == 0) {
	        parametros_boton.transparencia += 0.05;
		
	        if (parametros_boton.transparencia >= 1) {
				parametros_boton.estado = 1;
			}
	    } else {
	       parametros_boton.transparencia -= 0.05;
	   
	       if (parametros_boton.transparencia <= 0) {
			   parametros_boton.estado = 0;
		   }
	    }

	    if (permitir_transicion and controles.boton_presionado("boton_salto")) {
			permitir_transicion = false;
			
			audio.detener_canciones();
	        audio.reproducir_audio(snd_confirmar_opcion);
			transiciones.iniciar_efecto_intraniveles("morado", 0.015, rm_hub_world);
	    }
        break;
}

	
if (fase_animacion >= 4) {
    if (parametros_bandas.superior.pos_y < parametros_bandas.superior.pos_y_final) {
		parametros_bandas.superior.pos_y += 2;
	} else {
        parametros_bandas.superior.pos_y = parametros_bandas.superior.pos_y_final;
	}
    
    if (parametros_bandas.inferior.pos_y > parametros_bandas.inferior.pos_y_final) {
		parametros_bandas.inferior.pos_y -= 2;
	} else {
        parametros_bandas.inferior.pos_y = parametros_bandas.inferior.pos_y_final;
	}
}
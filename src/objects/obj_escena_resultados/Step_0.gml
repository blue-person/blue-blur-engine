// Gestionar la transparencia del marco
if (parametros_titulo.marco.transparencia < 1) {
	parametros_titulo.marco.transparencia += 0.05;
}

// Gestionar la fase de la animación
switch (fase_animacion) {
    case 1:
		// Modificar posicion
		parametros_titulo.texto.pos_x += 12;
		
		// Cambiar de fase
		if (parametros_titulo.texto.pos_x >= parametros_titulo.texto.pos_x_final) {
			fase_animacion = 2;
			if (not alarm[1]) then alarm[1] = 120;
		}
        break;
	case 3:
		// Modificar posicion
		parametros_titulo.marco.pos_y -= 3;
		parametros_titulo.texto.pos_y -= 3;
		
		// Cambiar de fase
	    if (parametros_titulo.texto.pos_y <= parametros_titulo.texto.pos_y_final) {
	        fase_animacion = 4;
	    }
        break;
    case 4:
		// Modificar posicion
        parametros_tiempo.titulo.pos_x += 12;
	    parametros_tiempo.texto.pos_x -= 12;
		
		// Cambiar de fase
	    if (parametros_tiempo.titulo.pos_x >= parametros_tiempo.titulo.pos_x_final) {
			fase_animacion = 5;
		}
        break;
    case 5:
		// Modificar posicion
        parametros_rings.titulo.pos_x += 12;
	    parametros_rings.texto.pos_x -= 12;
		
		// Cambiar de fase
	    if (parametros_rings.titulo.pos_x >= parametros_rings.titulo.pos_x_final) {
			fase_animacion = 6;
		}
        break;
    case 6:
		// Modificar posicion
        parametros_cool.titulo.pos_x += 12;
	    parametros_cool.texto.pos_x -= 12;
		
		// Cambiar de fase
	    if (parametros_cool.titulo.pos_x >= parametros_cool.titulo.pos_x_final) {
			fase_animacion = 7;
		}
        break;
    case 7:
		// Modificar posicion
        parametros_final.titulo.pos_x += 12;
		
		// Cambiar de fase
	    if (parametros_final.titulo.pos_x >= parametros_final.titulo.pos_x_final) {
			fase_animacion = 8;
			if (not alarm[2]) then alarm[2] = 60;
		}
        break;
    case 9:
		// Determinar puntaje final
		if (controles.boton_presionado("boton_salto") or controles.boton_presionado("boton_entrada")) {
			// Calcular el puntaje automaticamente
			parametros_final.texto.contenido += parametros_tiempo.texto.contenido;
			parametros_tiempo.texto.contenido = 0;
			
			parametros_final.texto.contenido += parametros_rings.texto.contenido;
			parametros_rings.texto.contenido = 0;
			
			parametros_final.texto.contenido += parametros_cool.texto.contenido;
			parametros_cool.texto.contenido = 0;
		} else {
			// Calcular el puntaje de manera incremental
			var velocidad_calculo = 100;
			var valor_incremento_tiempo = min(velocidad_calculo, parametros_tiempo.texto.contenido);
			var valor_incremento_rings = min(velocidad_calculo, parametros_rings.texto.contenido);
			var valor_incremento_cool = min(velocidad_calculo, parametros_cool.texto.contenido);
			
			parametros_final.texto.contenido += valor_incremento_tiempo;
			parametros_tiempo.texto.contenido -= valor_incremento_tiempo;
			
			parametros_final.texto.contenido += valor_incremento_rings;
			parametros_rings.texto.contenido -= valor_incremento_rings;
			
			parametros_final.texto.contenido += valor_incremento_cool;
			parametros_cool.texto.contenido -= valor_incremento_cool;
		}
	
		// Ajustar fase
		var tiempo_esta_vacio = (parametros_tiempo.texto.contenido == 0);
		var rings_esta_vacio = (parametros_rings.texto.contenido == 0);
		var cool_esta_vacio = (parametros_cool.texto.contenido == 0);
		
	    if (tiempo_esta_vacio and rings_esta_vacio and cool_esta_vacio) {
	        audio.reproducir_audio(snd_registrar_puntaje);
			fase_animacion = 10;
	        if (not alarm[3]) then alarm[3] = 180;
	    } else {
			audio.reproducir_audio_aislado(snd_agregar_puntos, true);
		}
        break;
	case 11:
		if (parametros_calificacion.transparencia < 1) {
			// Gestionar la visualizacion de la calificacion
		    parametros_calificacion.transparencia += 0.05;
		    parametros_calificacion.escala_x -= 0.5;
		    parametros_calificacion.escala_y -= 0.5;
		} else if (parametros_calificacion.transparencia == 1) {
			// Cambiar de fase
			fase_animacion = 12;
			audio.reproducir_audio(snd_mostrar_calificacion);
		}
		break;
    case 13:
	    if (permitir_transicion and controles.boton_presionado("boton_salto")) {
			// Salir del nivel
			permitir_transicion = false;
			audio.detener_canciones();
	        audio.reproducir_audio(snd_confirmar_opcion);
			transiciones.iniciar_efecto_intraniveles("morado", 0.015, rm_hub_world);
	    } else {
			// Determinar transparencia del boton de continuar
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
		}
        break;
}

// Gestionar la posición de las bandas
if (fase_animacion >= 4) {
	// Barra superior
    if (parametros_bandas.superior.pos_y < parametros_bandas.superior.pos_y_final) {
		parametros_bandas.superior.pos_y += 2;
	} else {
        parametros_bandas.superior.pos_y = parametros_bandas.superior.pos_y_final;
	}
    
	// Barra inferior
    if (parametros_bandas.inferior.pos_y > parametros_bandas.inferior.pos_y_final) {
		parametros_bandas.inferior.pos_y -= 2;
	} else {
        parametros_bandas.inferior.pos_y = parametros_bandas.inferior.pos_y_final;
	}
}
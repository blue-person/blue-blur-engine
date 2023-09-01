// Modificaciones para el jugador
if (instance_exists(obj_jugador)) {
	if (enfoque_camara == obj_jugador) {
		// Variables
		var mirando_hacia_arriba = (obj_jugador.accion == -3);
		var realizando_spindash = (obj_jugador.accion == -2);
		var mirando_hacia_abajo = (obj_jugador.accion == -1);
		var permitir_inclinar_verticalmente = (mirando_hacia_arriba or mirando_hacia_abajo);

	    // Establecer valores de la camara extendida, siempre que un QTE no este en proceso
	    if (permitir_camara_extendida and (obj_jugador.accion != 14)) {
			// Variables
			var velocidad_horizontal = abs(obj_jugador.velocidad_horizontal);
	        var permitir_inclinar_horizontalmente = abs(desplazamiento_x) <= indice_inclinacion_horizontal;
		
	        // Desplazar camara
	        if (permitir_inclinar_horizontalmente and (velocidad_horizontal >= limite_velocidad_horizontal)) {
	            desplazamiento_x += velocidad_inclinacion_horizontal * obj_jugador.direccion_horizontal;
	        } else {
	            desplazamiento_x -= velocidad_inclinacion_horizontal * sign(desplazamiento_x);
	        }

	        // Establecer modo de seguimiento
	        modo_seguimiento = "suave";
	    } else {
	        // Eliminar desplazamiento y establecer modo de seguimiento
	        desplazamiento_x = 0;
	        modo_seguimiento = "inmediato";
	    }

		// Verificar si es posible inclinar la camara verticalmente
	    if (permitir_inclinar_verticalmente) {
			if (retraso_inclinacion_vertical) {
				retraso_inclinacion_vertical--;
			}
		} else if (realizando_spindash) {
			retraso_inclinacion_vertical = 120;
		}
	
		// Subir o bajar la camara dependiendo de la accion del jugador
		if (not retraso_inclinacion_vertical and permitir_inclinar_verticalmente) {
			if (mirando_hacia_abajo and (desplazamiento_y < 85)) {
				desplazamiento_y += velocidad_inclinacion_vertical;
			} else if (mirando_hacia_arriba and (desplazamiento_y > -100)) {
				desplazamiento_y -= velocidad_inclinacion_vertical;
			}
		} else if (desplazamiento_y != 0) {
			desplazamiento_y -= velocidad_inclinacion_vertical * sign(desplazamiento_y);
	    }
	}
}

// Gestionar el enfoque de la camara
if (enfoque_camara != noone) {
    var pos_x_objetivo = enfoque_camara.x + desplazamiento_x;
    var pos_y_objetivo = enfoque_camara.y + desplazamiento_y;

    if (modo_seguimiento == "inmediato") {
        pos_x = pos_x_objetivo;
        pos_y = pos_y_objetivo;
    } else if (modo_seguimiento == "suave") {
        pos_x = lerp(x, pos_x_objetivo, valor_interpolacion);
        pos_y = lerp(y, pos_y_objetivo, valor_interpolacion);
    }
}

// Sacudir camara
if (permitir_sacudir) {
    pos_x += irandom_range(-valor_sacudida_restante, valor_sacudida_restante);
    pos_y += irandom_range(-valor_sacudida_restante, valor_sacudida_restante);

    if (valor_sacudida_restante == 0) {
        permitir_sacudir = false;
    } else {
        var indice_sacudida = valor_sacudida_restante - (magnitud_sacudida / duracion_sacudida);
        valor_sacudida_restante = max(0, floor(indice_sacudida));
    }
}

// Hacer que la camara no se salga de los bordes del nivel
var mitad_ancho = pantalla.obtener_ancho() / 2;
var mitad_altura = pantalla.obtener_altura() / 2;
x = clamp(pos_x, mitad_ancho, room_width - mitad_ancho);
y = clamp(pos_y, mitad_altura, room_height - mitad_altura);

// Establecer la vista de la camara
var matriz_visualizacion = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camara, matriz_visualizacion);
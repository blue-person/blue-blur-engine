if (objetivo != noone) {
    // Modificaciones para el jugador
    if (objetivo == jugador) {
		// Variables
        var accion_jugador = objetivo.accion;

        // Gestion del desplazamiento horizontal
        if (permitir_camara_extendida) {
            if (accion_jugador == 14) {
                // Eliminar efecto de cámara extendida si hay un QTE en proceso
                modo_seguimiento = "inmediato";
                desplazamiento_x = 0;
                desplazamiento_y = 0;
            } else {
                // Establecer modo de seguimiento
                modo_seguimiento = "suave";

                // Determinar si realizar el desplazamiento
                var velocidad_objetivo_requerida = abs(objetivo.velocidad_horizontal) >= (objetivo.limite_velocidad_horizontal / 2);
                var permitir_inclinar_horizontalmente = abs(desplazamiento_x) <= indice_inclinacion_horizontal;

                if (permitir_inclinar_horizontalmente and velocidad_objetivo_requerida) {
                    desplazamiento_x += velocidad_inclinacion_horizontal * objetivo.direccion_horizontal;
                } else {
                    desplazamiento_x -= velocidad_inclinacion_horizontal * sign(desplazamiento_x);
                }
            }
        }

        // Gestion del desplazamiento vertical
        var mirando_hacia_arriba = (accion_jugador == -3);
        var mirando_hacia_abajo = (accion_jugador == -1);

        if (mirando_hacia_abajo or mirando_hacia_arriba) {
            if (tiempo_restante_para_inclinar > 0) {
                // Disminuir tiempo restante
                tiempo_restante_para_inclinar--;
            } else {
                // Subir o bajar la cámara en base a la acción del usuario
                if (mirando_hacia_abajo and (desplazamiento_y < indice_inclinacion_inferior)) {
                    desplazamiento_y += velocidad_inclinacion_vertical;
                } else if (mirando_hacia_arriba and (desplazamiento_y > indice_inclinacion_superior)) {
                    desplazamiento_y -= velocidad_inclinacion_vertical;
                }
            }
        } else {
            // Restablecer el tiempo restante
            tiempo_restante_para_inclinar = tiempo_requerido_para_inclinar;

            // Restablecer el desplazamiento vertical
            if (desplazamiento_y != 0) {
                desplazamiento_y -= velocidad_inclinacion_vertical * sign(desplazamiento_y);
            }
        }
    }

    // Gestion de la camara al enfocar un objeto
    var pos_x_objetivo = objetivo.x + desplazamiento_x;
    var pos_y_objetivo = objetivo.y + desplazamiento_y;

    if (modo_seguimiento == "inmediato") {
        x = pos_x_objetivo;
        y = pos_y_objetivo;
    } else if (modo_seguimiento == "suave") {
        x += (pos_x_objetivo - x) / indice_ajuste_posicional;
        y += (pos_y_objetivo - y) / indice_ajuste_posicional;
    }
	
	// Sacudir camara
	if (duracion_sacudida > 0) {
	    var valor_incremento = (6 + duracion_sacudida) / 6;
	    x += (choose(-1, 1) * irandom_range(8, 15) * valor_incremento) / 128;
	    y += (choose(-1, 1) * irandom_range(128, 255) * valor_incremento) / 255;
	    duracion_sacudida--;
	}

	// Hacer que la camara no se salga de los bordes del nivel
	x = clamp(x, mitad_ancho_pantalla, room_width - mitad_ancho_pantalla);
	y = clamp(y, mitad_altura_pantalla, room_height - mitad_altura_pantalla);
}

// Establecer la vista de la cámara
var matriz_visualizacion = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(controlador_camara, matriz_visualizacion);
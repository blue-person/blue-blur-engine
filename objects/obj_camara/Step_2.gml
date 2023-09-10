// Modificaciones para el jugador
if (instance_exists(obj_jugador)) {
    if (enfoque_camara == obj_jugador) {
        // Gestion del eesplazamiento horizontal
	    if (permitir_camara_extendida) {
			if (obj_jugador.accion == 14) {
				// Eliminar efecto de camara extendida si hay un QTE en proceso
				modo_seguimiento = "inmediato";
		        desplazamiento_x = 0;
		        desplazamiento_y = 0;
			} else {
		        // Establecer modo de seguimiento
				modo_seguimiento = "suave";
				
		        // Determinar si realizar el desplazamiento
				var permitir_inclinar_horizontalmente = abs(desplazamiento_x) <= indice_inclinacion_horizontal;
				var velocidad_jugador_requerida = abs(obj_jugador.velocidad_horizontal) >= (obj_jugador.limite_velocidad_horizontal / 2);
				
		        if (permitir_inclinar_horizontalmente and velocidad_jugador_requerida) {
		            desplazamiento_x += velocidad_inclinacion_horizontal * obj_jugador.direccion_horizontal;
		        } else {
		            desplazamiento_x -= velocidad_inclinacion_horizontal * sign(desplazamiento_x);
		        }
			}
	    }

        // Gestion del desplazamiento vertical
        var mirando_hacia_arriba = (obj_jugador.accion == -3);
        var mirando_hacia_abajo = (obj_jugador.accion == -1);

		if (mirando_hacia_abajo or mirando_hacia_arriba) {
            if (tiempo_restante_para_inclinar > 0) {
				// Disminuir tiempo restante
                tiempo_restante_para_inclinar--;
            } else {
				// Subir o bajar la camara en base a la accion del usuario
                if (mirando_hacia_abajo and (desplazamiento_y < indice_inclinacion_inferior)) {
                    desplazamiento_y += velocidad_inclinacion_vertical;
                } else if (mirando_hacia_arriba and (desplazamiento_y > indice_inclinacion_superior)) {
                    desplazamiento_y -= velocidad_inclinacion_vertical;
                }
            }
        } else {
			// Reestablecer el tiempo restante
            tiempo_restante_para_inclinar = tiempo_requerido_para_inclinar;
			
			// Reestablecer el desplazamiento vertical
            if (desplazamiento_y != 0) {
                desplazamiento_y -= velocidad_inclinacion_vertical * sign(desplazamiento_y);
            }
        }
    }
}

// Gestionar el enfoque de la camara
if (enfoque_camara != noone) {
    var pos_x_objetivo = enfoque_camara.x + desplazamiento_x;
    var pos_y_objetivo = enfoque_camara.y + desplazamiento_y;

    if (modo_seguimiento == "inmediato") {
        x = pos_x_objetivo;
        y = pos_y_objetivo;
    } else if (modo_seguimiento == "suave") {
        x += (pos_x_objetivo - x) / indice_ajuste_posicional;
        y += (pos_y_objetivo - y) / indice_ajuste_posicional;
    }
}

// Sacudir camara
if (duracion_sacudida > 0) {
	var valor_incremento = (6 + duracion_sacudida) / 6;
	x += (choose(-1, 1) * irandom_range(8, 15) * valor_incremento) / 128;
	y += (choose(-1, 1) * irandom_range(128, 255) * valor_incremento) / 255;
	duracion_sacudida--;
}

// Hacer que la camara no se salga de los bordes del nivel
var mitad_ancho = pantalla.obtener_ancho() * 0.5;
var mitad_altura = pantalla.obtener_altura() * 0.5;
x = clamp(x, mitad_ancho, room_width - mitad_ancho);
y = clamp(y, mitad_altura, room_height - mitad_altura);

// Establecer la vista de la camara
var matriz_visualizacion = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camara, matriz_visualizacion);